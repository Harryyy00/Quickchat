part of 'chat_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.connectChatStream() = _ConnectChatStream;

  const factory ChatsEvent.disposeChatStream() = _DisposeChatStream;

  const factory ChatsEvent.getConversation({
    required StateStatus stateStatus,
    required int page,
  }) = _GetConversation;

  const factory ChatsEvent.selectUsername({
    required String userName,
  }) = _SelectUsername;

  const factory ChatsEvent.unSelectUsername() = _UnSelectUsername;

  const factory ChatsEvent.getConversations({
    required StateStatus stateStatus,
    required GetConversationsDto getConversations,
  }) = _GetConversations;

  const factory ChatsEvent.disposeChatData() = _DisposeChatData;

  const factory ChatsEvent.sendChat({
    required String recipient,
    required String content,
  }) = _SendChat;

  const factory ChatsEvent.changeStateStatus({
    required StateStatus stateStatus,
    String? errorMessage,
  }) = _ChangeStateStatus;
}
