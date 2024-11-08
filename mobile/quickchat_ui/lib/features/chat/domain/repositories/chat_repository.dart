import 'package:dartz/dartz.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversations.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationsData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/GetConversations.dto.dart';

abstract class ChatRepository {
  Stream<Result<ConversationsDto>> connectChatStream();
  void disposeChatStream();
  Future<Result<ConversationDataDto>> getConversation({
    required int page,
  });
  Future<Result<ConversationsDataDto>> getConversations({
    required GetConversationsDto getConversations,
  });
  Future<Result<Unit>> sendChat({
    required String recipient,
    required String content,
  });
}
