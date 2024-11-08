import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/cache_exeption.dart';
import 'package:quickchat_ui/core/logic/error_messages.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/core/logic/server_exeption.dart';
import 'package:quickchat_ui/core/network/network_info.dart';
import 'package:quickchat_ui/features/chat/data/datasources/chat_local_datasource.dart';
import 'package:quickchat_ui/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversations.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationsData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/GetConversations.dto.dart';
import 'package:quickchat_ui/features/chat/domain/repositories/chat_repository.dart';

@Environment(Environment.prod)
@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({
    required this.networkInfo,
    required this.chatRemoteDatasource,
    required this.chatLocalDatasource,
  });
  final NetworkInfo networkInfo;
  final ChatRemoteDatasource chatRemoteDatasource;
  final ChatLocalDatasource chatLocalDatasource;

  @override
  Stream<Result<ConversationsDto>> connectChatStream() {
    late String accessToken;
    try {
      accessToken = chatLocalDatasource.getToken();
    } catch (e) {
      if (e is CacheException) {
        return Stream<Result<ConversationsDto>>.value(
            Result<ConversationsDto>.fail(error: e.message));
      } else {
        return Stream<Result<ConversationsDto>>.value(
            Result<ConversationsDto>.fail(error: e.toString()));
      }
    }

    final Stream<dynamic> stream =
        chatRemoteDatasource.connectChatStream(accessToken);

    return stream.map((dynamic event) {
      if (event is ConversationsDto) {
        return Result<ConversationsDto>.ok(data: event);
      } else if (event is String) {
        return Result<ConversationsDto>.fail(error: event);
      } else {
        return Result<ConversationsDto>.fail(
            error: 'Unknown error: ${event.toString()}');
      }
    });
  }

  @override
  void disposeChatStream() {
    chatRemoteDatasource.disposeChatStream();
  }

  @override
  Future<Result<ConversationDataDto>> getConversation(
      {required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final ConversationDataDto loginResult =
            await chatRemoteDatasource.getConversation(page: page);

        return Result<ConversationDataDto>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<ConversationDataDto>.fail(error: e.message);
      }
    } else {
      return const Result<ConversationDataDto>.fail(
          error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<ConversationsDataDto>> getConversations(
      {required GetConversationsDto getConversations}) async {
    if (await networkInfo.isConnected) {
      try {
        final ConversationsDataDto result =
            await chatRemoteDatasource.getConversations(
          conversationsId: getConversations.conversationsId,
          page: getConversations.page,
        );

        return Result<ConversationsDataDto>.ok(data: result);
      } on ServerException catch (e) {
        return Result<ConversationsDataDto>.fail(error: e.message);
      }
    } else {
      return const Result<ConversationsDataDto>.fail(
          error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<Unit>> sendChat({
    required String recipient,
    required String content,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final Unit loginResult = await chatRemoteDatasource.sendChat(
          recipient: recipient,
          content: content,
        );

        return Result<Unit>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<Unit>.fail(error: e.message);
      }
    } else {
      return const Result<Unit>.fail(error: ERR_NO_INTERNET_CONNECTION);
    }
  }
}
