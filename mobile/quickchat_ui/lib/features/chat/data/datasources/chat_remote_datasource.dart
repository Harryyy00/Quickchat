import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';
import 'package:quickchat_ui/core/logic/server_exeption.dart';
import 'package:quickchat_ui/core/sse/quick_chat_sse.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversations.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationsData.dto.dart';

abstract class ChatRemoteDatasource {
  Stream<dynamic> connectChatStream(
    String accessToken,
  );
  void disposeChatStream();

  Future<ConversationDataDto> getConversation({required int page});
  Future<ConversationsDataDto> getConversations({
    required String conversationsId,
    required int page,
  });
  Future<Unit> sendChat({
    required String recipient,
    required String content,
  });
}

@LazySingleton(as: ChatRemoteDatasource)
class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  ChatRemoteDatasourceImpl({
    required this.dio,
    required this.config,
    required this.quickChatSse,
  });

  final Dio dio;
  final Config config;
  final QuickChatSse quickChatSse;

  @override
  Stream connectChatStream(String accessToken) {
    final Stream<dynamic> stream = quickChatSse.connectChatStream(accessToken);

    return stream.map((dynamic event) {
      if (event is Map<String, dynamic>) {
        return ConversationsDto.fromJson(event);
      }

      return null;
    }).where((ConversationsDto? event) => event != null);
  }

  @override
  void disposeChatStream() {
    quickChatSse.disposeChatStream();
  }

  @override
  Future<ConversationDataDto> getConversation({required int page}) async {
    late Response<dynamic> response;
    late ConversationDataDto resultData;

    try {
      final Map<String, dynamic> rawData = <String, dynamic>{
        'page': page,
      };
      // Fetch conversation data
      response = await dio.get(
        '${config.quickChatService}/conversation',
        data: jsonEncode(rawData),
      );

      final Map<String, dynamic> result = response.data['data'];

      resultData = ConversationDataDto.fromJson(result);
    } on DioException catch (e) {
      throw checkErrResponse(e.response);
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 200) {
      return resultData;
    } else {
      throw checkErrResponse(response);
    }
  }

  @override
  Future<ConversationsDataDto> getConversations({
    required String conversationsId,
    required int page,
  }) async {
    late Response<dynamic> response;
    late ConversationsDataDto resultData;

    try {
      final Map<String, dynamic> rawData = <String, dynamic>{
        'conversationsId': conversationsId,
        'page': page,
      };
      // Fetch conversations data
      response = await dio.get(
        '${config.quickChatService}/conversations',
        data: jsonEncode(rawData),
      );
      final Map<String, dynamic> result = response.data['data'];

      resultData = ConversationsDataDto.fromJson(result);
    } on DioException catch (e) {
      throw checkErrResponse(e.response);
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 200) {
      return resultData;
    } else {
      throw checkErrResponse(response);
    }
  }

  @override
  Future<Unit> sendChat({
    required String recipient,
    required String content,
  }) async {
    late Response<dynamic> response;

    try {
      // Prepare the data
      final Map<String, dynamic> rawData = <String, dynamic>{
        'recipient': recipient,
        'content': content,
      };

      // Send the chat message
      response = await dio.post(
        '${config.quickChatService}/chat/send',
        data: jsonEncode(rawData),
      );
      // Trigger the sse
      dio.post('${config.quickChatSSEService}/chat/send',
          data: jsonEncode(rawData));
    } on DioException catch (e) {
      throw checkErrResponse(e.response);
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 201) {
      return unit;
    } else {
      throw checkErrResponse(response);
    }
  }
}
