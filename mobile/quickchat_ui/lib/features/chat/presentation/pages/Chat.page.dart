import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/widgets/templates/base_appbar.dart';
import 'package:quickchat_ui/core/widgets/templates/base_body.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversations.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/ConversationsData.dto.dart';
import 'package:quickchat_ui/features/chat/data/dto/GetConversations.dto.dart';
import 'package:quickchat_ui/features/chat/usecase/DisposeChatData.usecase.dart';
import 'package:quickchat_ui/features/chat/usecase/GetConversations.usecase.dart';
import 'package:quickchat_ui/features/chat/usecase/SendChat.usecase.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.conversationId,
    required this.name,
  });

  final String conversationId;
  final String name;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late AuthBloc _authBloc;
  late ChatsBloc _chatsBloc;
  late GetConversationsUsecase _getConversationsUsecase;
  late SendChatChatUsecase _sendChatChatUsecase;
  late DisposeChatDataUsecase _disposeChatDataUsecase;

  // late AutoScrollController _scrollController;
  Timer? _debounceTimer;

  final TextEditingController _textController = TextEditingController();

  bool isInitial = false;

  late types.User _currentUser;

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    _chatsBloc = getIt<ChatsBloc>();
    _getConversationsUsecase = getIt<GetConversationsUsecase>();
    _sendChatChatUsecase = getIt<SendChatChatUsecase>();
    _disposeChatDataUsecase = getIt<DisposeChatDataUsecase>();

    _currentUser = types.User(
      id: _authBloc.state.loginDatas!.user.id,
      firstName: _authBloc.state.loginDatas!.user.userName,
    );

    if (widget.conversationId.isNotEmpty) {
      _getConversations(
        StateStatus.loadingState,
        GetConversationsDto(
          conversationsId: widget.conversationId,
          page: 1,
        ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _textController.dispose();
    _disposeChatDataUsecase.execute();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: widget.name,
        ),
        body: BaseBody(
          child: BlocConsumer<ChatsBloc, ChatsState>(
            bloc: _chatsBloc,
            listener: _chatListeners,
            builder: (BuildContext context, ChatsState chatsState) {
              const customMessengerTheme = DefaultChatTheme(
                primaryColor: Colors.redAccent,
                backgroundColor: Colors.white,
                inputBackgroundColor: Colors.transparent,
                inputTextColor: Colors.black,
                inputContainerDecoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                inputBorderRadius: BorderRadius.all(Radius.circular(10)),
                userAvatarNameColors: [
                  Colors.redAccent,
                ],
                sendButtonIcon: Icon(FluentIcons.send_32_filled),
              );

              final bool isLastPage = chatsState.conversations?.currentPage ==
                  chatsState.conversations?.maxPage;

              if (chatsState.stateStatus == StateStatus.loadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<ConversationsDto> conversationsList =
                  chatsState.conversationsList;

              final List<types.Message> messages =
                  conversationsList.reversed.map((conversation) {
                final isMe = conversation.sender ==
                    _authBloc.state.loginDatas?.user.userName;

                return types.TextMessage(
                  id: conversation.sentAt.toString(),
                  author: isMe
                      ? _currentUser
                      : types.User(
                          id: conversation.sentAt.toString(),
                          firstName: conversation.sender,
                        ),
                  text: conversation.content,
                  showStatus: true,
                  status: types.Status.sent,
                );
              }).toList();

              return Chat(
                user: _currentUser,
                messages: messages,
                onSendPressed: _handleSubmitted,
                showUserAvatars: true,
                theme: customMessengerTheme,
                showUserNames: true,
                isLastPage: isLastPage,
                onEndReached: () async {
                  if (!chatsState.isConversationsLoaded) {
                    _getNextPage();
                  }
                },
              );
            },
          ),
        ));
  }

  void _chatListeners(BuildContext context, ChatsState state) {
    if (state.stateStatus == StateStatus.errorState) {
      final snackBar = SnackBar(content: Text('${state.errorMessage}'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _getConversations(StateStatus stateStatus, GetConversationsDto dto) {
    _getConversationsUsecase.execute(
      stateStatus: stateStatus,
      getConversations: dto,
    );
  }

  void _handleSubmitted(types.PartialText message) {
    _sendChatChatUsecase.execute(
      recipient: widget.name,
      content: message.text,
    );
  }

  void _getNextPage() {
    final ConversationsDataDto? conversations = _chatsBloc.state.conversations;
    final int currentPage = conversations?.currentPage ?? 0;
    final int maxPage = conversations?.maxPage ?? 0;
    if (currentPage != maxPage && widget.conversationId.isNotEmpty) {
      _getConversations(
          StateStatus.loadedState,
          GetConversationsDto(
            conversationsId: widget.conversationId,
            page: currentPage + 1,
          ));
    }
  }
}
