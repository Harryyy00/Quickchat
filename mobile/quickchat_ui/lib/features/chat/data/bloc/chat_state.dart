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
    String? selectedConversationId,
    required bool isCurrentlyOnChatPage,
    required bool isChatUpdated,
    required bool isChatSent,
    required bool isConversationLoaded,
    required bool isConversationsLoaded,
  }) = _ChatsState;

  factory ChatsState.initial() => const ChatsState(
        stateStatus: StateStatus.initialState,
        chatStatus: StateStatus.initialState,
        conversationList: <ConversationDto>[],
        conversationsList: <ConversationsDto>[],
        isCurrentlyOnChatPage: false,
        isChatUpdated: false,
        isChatSent: false,
        isConversationLoaded: false,
        isConversationsLoaded: false,
      );
}
