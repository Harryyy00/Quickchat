part of 'chat_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState({
    String? errorMessage,
    required StateStatus stateStatus,
    required StateStatus chatStatus,
    ConversationDataDto? conversation,
    required List<ConversationDto> conversationList,
    ConversationsDataDto? conversations,
    required List<ConversationsDto> conversationsList,
    required bool isConversationLoaded,
    required bool isConversationsLoaded,
    required bool isChatConnected,
    String? selectedUserName,
  }) = _ChatsState;

  factory ChatsState.initial() => const ChatsState(
        stateStatus: StateStatus.initialState,
        chatStatus: StateStatus.initialState,
        conversationList: <ConversationDto>[],
        conversationsList: <ConversationsDto>[],
        isConversationLoaded: false,
        isConversationsLoaded: false,
        isChatConnected: false,
      );
}
