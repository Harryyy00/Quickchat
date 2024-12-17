import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';

abstract class QuickChatSse {
  Stream<dynamic> connectChatStream(String accessToken);
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

  Stream<SSEModel>? _sseClient;
  StreamSubscription<SSEModel>? _sseClientSub;
  late StreamController<dynamic> _chatMessagesController;
  late StreamController<dynamic> _chatErrorController;
  bool _isControllerInitialized = false;
  bool _isSubscribed = false;

  int _attempt = 0;
  final List<int> _fibonacciBackoff = [1, 2];

  @override
  Stream<dynamic> connectChatStream(String accessToken) async* {
    print('ni connect nasad');
    _initializeControllers();
    final String sseUrl = '${config.quickChatSSEService}/chat/events';

    while (_attempt < _fibonacciBackoff.length) {
      try {
        final Response<dynamic> response = await dio.head(sseUrl);
        if (response.statusCode == 200) {
          _subscribeToSse(sseUrl, accessToken);
          _listenToSseEvents();
          yield* _chatMessagesController.stream;
          return; // Exit retry loop on successful connection
        }
      } catch (e) {
        _handleRetryOrFail(e);
      }
    }
    throw Exception(
        'Failed to connect to SSE after ${_fibonacciBackoff.length} attempts');
  }

  @override
  Stream<dynamic> onSseError() => _chatErrorController.stream;

  @override
  void disposeChatStream() {
    if (_isControllerInitialized) {
      _sseClientSub?.cancel();
      _sseClient = null;

      _safeCloseStream(_chatMessagesController);
      _safeCloseStream(_chatErrorController);

      SSEClient.unsubscribeFromSSE();
      _isControllerInitialized = false;
      _isSubscribed = false;

      print('SSE connection disposed successfully');
    } else {
      print('SSE connection is not active');
    }
  }

  /// Initializes the stream controllers if they haven't been created yet.
  void _initializeControllers() {
    if (!_isControllerInitialized) {
      _chatMessagesController = StreamController<dynamic>.broadcast();
      _chatErrorController = StreamController<dynamic>.broadcast();
      _isControllerInitialized = true;
    }
  }

  /// Subscribes to the SSE stream.
  void _subscribeToSse(String sseUrl, String accessToken) {
    if (!_isSubscribed) {
      _sseClient = SSEClient.subscribeToSSE(
        method: SSERequestType.GET,
        url: sseUrl,
        header: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        },
      );
      _isSubscribed = true;
      print('Subscribed to SSE at $sseUrl');
    } else {
      print('Already subscribed to SSE');
    }
  }

  /// Listens to SSE events and forwards them to the message controller.
  void _listenToSseEvents() {
    _sseClientSub = _sseClient?.listen(
      (SSEModel event) {
        if (event.data is String) {
          try {
            final dynamic jsonData = json.decode(event.data ?? '');
            _chatMessagesController.sink.add(jsonData);
          } catch (e) {
            print('Error decoding SSE data: $e');
          }
        }
      },
      onError: (dynamic error) {
        print('SSE Error: $error');
        _chatErrorController.sink.add(error);
      },
      onDone: () {
        print('SSE connection closed');
      },
      cancelOnError: true,
    );
  }

  /// Handles retries using exponential backoff or throws on failure.
  void _handleRetryOrFail(dynamic error) {
    if (_attempt < _fibonacciBackoff.length) {
      final int waitTime = _fibonacciBackoff[_attempt];
      print(
          'Attempt ${_attempt + 1}/${_fibonacciBackoff.length} failed. Retrying in $waitTime seconds...');
      _chatErrorController.sink.add(error);
      _attempt++;
      _fibonacciBackoff.add(_fibonacciBackoff.last +
          _fibonacciBackoff[_fibonacciBackoff.length - 2]);
      Future.delayed(Duration(seconds: waitTime));
    } else {
      throw Exception('SSE connection failed: $error');
    }
  }

  /// Safely closes a stream controller if it's not already closed.
  void _safeCloseStream(StreamController<dynamic> controller) {
    if (!controller.isClosed) {
      controller.close();
    }
  }
}
