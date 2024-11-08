import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversation.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversations.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationsData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/GetConversations.dto.dart';
import 'package:quickchat_ui/features/chat/domain/repositories/chat_repository.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

@lazySingleton
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc({
    required this.chatRepository,
  }) : super(ChatsState.initial()) {
    on<_GetConversation>(
        (_GetConversation event, Emitter<ChatsState> emit) async {
      emit(state.copyWith(
        stateStatus: event.stateStatus,
      ));

      final Result<ConversationDataDto> result =
          await chatRepository.getConversation(page: event.page);

      if (result.isFailure) {
        emit(state.copyWith(
          stateStatus: StateStatus.errorState,
          errorMessage: result.getError,
        ));
      } else {
        final ConversationDataDto conversationDataDto = result.getValue;
        final List<ConversationDto> resultList =
            conversationDataDto.conversationList.toList();
        emit(state.copyWith(
          conversation: conversationDataDto,
          conversationList: resultList,
          isConversationLoaded: true,
        ));
      }
      emit(state.copyWith(
        isConversationLoaded: false,
        stateStatus: StateStatus.loadedState,
      ));
    });

    on<_GetConversations>(
        (_GetConversations event, Emitter<ChatsState> emit) async {
      emit(state.copyWith(
        stateStatus: event.stateStatus,
      ));

      final Result<ConversationsDataDto> result =
          await chatRepository.getConversations(
        getConversations: event.getConversations,
      );

      emit(state.copyWith(
        selectedConversationId: event.getConversations.conversationsId,
      ));

      if (result.isFailure) {
        emit(state.copyWith(
          stateStatus: StateStatus.errorState,
          errorMessage: result.getError,
        ));
        emit(state.copyWith(stateStatus: StateStatus.loadedState));
      } else {
        final int page = event.getConversations.page;
        final ConversationsDataDto conversationsDataDto = result.getValue;
        final List<ConversationsDto> resultList =
            conversationsDataDto.conversationsList.toList();
        final List<ConversationsDto> updatedList = _getUpdatedList(
          state.conversationsList,
          resultList,
          page,
        );
        emit(state.copyWith(
          conversations: conversationsDataDto,
          conversationsList: updatedList,
          isConversationsLoaded: true,
        ));
        emit(state.copyWith(
          stateStatus: StateStatus.loadedState,
          isConversationsLoaded: false,
        ));
      }
    });

    on<_SendChat>((_SendChat event, Emitter<ChatsState> emit) async {
      final Result<Unit> result = await chatRepository.sendChat(
        recipient: event.recipient,
        content: event.content,
      );

      emit(state.copyWith(
        chatStatus: StateStatus.loadingState,
      ));

      if (!result.isSuccess) {
        emit(state.copyWith(
          chatStatus: StateStatus.errorState,
          errorMessage: result.getError,
        ));
      } else {
        emit(state.copyWith(
          chatStatus: StateStatus.loadedState,
          isChatSent: true,
        ));
      }
      emit(state.copyWith(
        chatStatus: StateStatus.loadedState,
        isChatSent: false,
      ));
    });

    on<_ConnectChatStream>(
      (_ConnectChatStream event, Emitter<ChatsState> emit) async {
        final Stream<Result<ConversationsDto>> resultStream =
            chatRepository.connectChatStream();

        await for (final Result<ConversationsDto> event in resultStream) {
          if (!isClosed) {
            if (!event.isSuccess) {
              add(ChatsEvent.changeStateStatus(
                stateStatus: StateStatus.errorState,
                errorMessage: event.getError,
              ));
            } else {
              add(const ChatsEvent.getConversation(
                  stateStatus: StateStatus.loadedState, page: 1));
              final ConversationsDto message = event.getValue;

              final List<ConversationsDto> currentConversations =
                  state.conversationsList.toList();

              // Create the updated conversation list
              final List<ConversationsDto> updatedConversations = [
                ...currentConversations,
                message,
              ];

              emit(state.copyWith(
                conversationsList: updatedConversations,
                isChatUpdated: true,
                chatStatus: StateStatus.loadedState,
              ));
            }
          }
          emit(state.copyWith(
            isChatUpdated: false,
            chatStatus: StateStatus.loadedState,
          ));
        }
      },
    );

    on<_DisposeChatStream>(
        (_DisposeChatStream event, Emitter<ChatsState> emit) {
      chatRepository.disposeChatStream();
    });

    on<_DisposeChatData>((_DisposeChatData event, Emitter<ChatsState> emit) {
      emit(state.copyWith(
        conversations: null,
        conversationsList: <ConversationsDto>[],
      ));
    });
  }

  List<T> _getUpdatedList<T>(
      List<T> currentList, List<T> resultList, int page) {
    final List<T> updatedList = <T>[];

    for (final T value in resultList) {
      if (!updatedList.contains(value)) {
        updatedList.add(value);
      } else {
        final int index =
            updatedList.indexWhere((T element) => element == value);
        if (index != 0) {
          updatedList.replaceRange(index, index + 1, <T>[value]);
        }
      }
    }

    if (page != 1) {
      for (final T value in currentList) {
        if (!updatedList.contains(value)) {
          updatedList.add(value);
        }
      }
    }

    return updatedList;
  }

  // List<T> _getUpdatedList<T>(
  //     List<T> currentList, List<T> resultList, int page) {
  //   final List<T> updatedList = <T>[];
  //   if (page != 1) {
  //     updatedList.addAll(currentList);
  //   }
  //   for (final T value in resultList) {
  //     if (!updatedList.contains(value)) {
  //       updatedList.add(value);
  //     } else {
  //       final int index =
  //           updatedList.indexWhere((T element) => element == value);
  //       if (index != 0) {
  //         updatedList.replaceRange(index, index + 1, <T>[value]);
  //       }
  //     }
  //   }
  //   return updatedList;
  // }

  final ChatRepository chatRepository;
}
