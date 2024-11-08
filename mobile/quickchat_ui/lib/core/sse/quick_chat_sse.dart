import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';

abstract class QuickChatSse {
  Stream<dynamic> connectChatStream(
    String accessToken,
  );
  Stream<dynamic> onSseError();
  void disposeChatStream();
}

@LazySingleton(as: QuickChatSse)
class QuickChatSseImpl implements QuickChatSse {
  QuickChatSseImpl({
    required this.config,
    required this.dio,
  });

  final Config config;
  final Dio dio;

  late Stream<SSEModel>? sseClient;
  late StreamSubscription<SSEModel>? sseClientSub;
  late StreamController<dynamic> chatMessagesController;
  late StreamController<dynamic> chatErrorController;
  bool isControllerInitialized = false;
  bool isSubScribed = false;

  int attempt = 0;
  List<int> fib = <int>[1, 2];

  @override
  Stream connectChatStream(String accessToken) async* {
    _initializeControllerIfNeeded();
    final String sseUrl = '${config.quickChatSSEService}/chat/events';
    attempt = 0;
    fib = <int>[1, 2];
    while (true) {
      try {
        final Response<dynamic> sseRes = await dio.head(sseUrl);
        if (sseRes.statusCode == 200) {
          _subscribe(sseUrl, accessToken);
          sseClientSub = sseClient?.listen(
            (dynamic event) {
              final SSEModel eventData = event;
              if (eventData.data is String) {
                try {
                  final dynamic jsonData = json.decode(eventData.data ?? '');

                  chatMessagesController.sink.add(jsonData);
                } catch (e) {
                  print('Error parsing JSON: $e');
                }
              }
            },
            onError: (e) {
              chatErrorController.sink.add(e);
            },
          );

          yield* chatMessagesController.stream;
          break; // Break the loop if successfully connected
        }
      } catch (e) {
        if (attempt >= fib.length) {
          chatErrorController.sink.add(e);
          throw Exception('Failed to connect to SSE endpoint');
        } else {
          final int waitTime = fib[attempt];
          // print(
          //     'Attempt ${attempt + 1}/${fib.length} failed. Retrying in $waitTime seconds.');
          // chatController.sink
          //     .add('Connection failed. Retrying in $waitTime seconds.');
          await Future<dynamic>.delayed(Duration(seconds: waitTime));
          attempt++;
          fib.add(fib[fib.length - 1] + fib[fib.length - 2]);
        }
      }
    }
  }

  @override
  Stream<dynamic> onSseError() {
    return chatErrorController.stream;
  }

  @override
  void disposeChatStream() {
    try {
      if (isControllerInitialized && sseClientSub != null) {
        sseClientSub?.cancel();
        chatMessagesController.close();
        chatErrorController.close();
        SSEClient.unsubscribeFromSSE();
        isControllerInitialized = false;
        isSubScribed = false;
      }
    } catch (e) {
      print('Cannot dispose not yet subscribe');
    }
  }

  /// private methods
  ///
  void _initializeControllerIfNeeded() {
    if (!isControllerInitialized) {
      chatMessagesController = StreamController<dynamic>.broadcast();
      chatErrorController = StreamController<dynamic>.broadcast();
      isControllerInitialized = true;
    }
  }

  void _subscribe(String sseUrl, String accessToken) {
    if (!isSubScribed) {
      sseClient = SSEClient.subscribeToSSE(
        method: SSERequestType.GET,
        url: sseUrl,
        header: <String, String>{
          'Authorization': 'Bearer $accessToken',
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        },
      );

      // chatMessageController.sink.add('Connected to the Messages');
      isSubScribed = true;
    } else {
      print('Already subscribed');
    }
  }
}
