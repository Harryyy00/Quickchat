import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/widgets/templates/base_appbar.dart';
import 'package:quickchat_ui/core/widgets/templates/empty_list_widget.dart';
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

  // late ToggleOnChatUsecase _toggleOnChatUsecase;
  late GetConversationsUsecase _getConversationsUsecase;
  late SendChatChatUsecase _sendChatChatUsecase;
  late DisposeChatDataUsecase _disposeChatDataUsecase;

  late StackRouter _router;

  final TextEditingController _textController = TextEditingController();
  late final ScrollController _scrollController = ScrollController();
  late bool isKeyboardVisible;
  Timer? _debounceTimer;
  late OverlayEntry scrollToBottomOverlayEntry;
  late Offset scrollToBottomOverlayOffset;
  bool showedScrollToBottomOverlay = false;
  bool isInitial = false;

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    _chatsBloc = getIt<ChatsBloc>();

    // _toggleOnChatUsecase = getIt<ToggleOnChatUsecase>();
    _getConversationsUsecase = getIt<GetConversationsUsecase>();
    _sendChatChatUsecase = getIt<SendChatChatUsecase>();
    _disposeChatDataUsecase = getIt<DisposeChatDataUsecase>();

    _router = AutoRouter.of(context);

    // _toggleOnChatUsecase.execute(isOnChat: true);
    _getConversations(
      StateStatus.loadingState,
      GetConversationsDto(
        conversationsId: widget.conversationId,
        page: 1,
      ),
    );

    isKeyboardVisible = false;
    scrollToBottomOverlayOffset = const Offset(180.0, 650.0);

    super.initState();
  }

  @override
  void dispose() {
    // _toggleOnChatUsecase.execute(isOnChat: false);
    _textController.dispose();
    _scrollController.dispose();
    if (showedScrollToBottomOverlay) {
      scrollToBottomOverlayEntry.remove();
    }

    isInitial = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    _keyboardAction();

    _scrollController.addListener(() {
      final double viewportHeight =
          _scrollController.position.viewportDimension;
      final double maxScrollExtent = _scrollController.position.maxScrollExtent;
      final double remainingExtent = maxScrollExtent - _scrollController.offset;
      if (_scrollController.offset <= 0 &&
          !_scrollController.position.outOfRange) {
        // If there's an existing timer, cancel it
        _debounceTimer?.cancel();

        // Start a new timer with a delay of 200 milliseconds
        _debounceTimer = Timer(const Duration(milliseconds: 200), () {
          // Call _getNextPage() after the delay
          _getNextPage();
        });
      }
      // // Check if the bottom of the list is not completely visible
      if (remainingExtent > viewportHeight) {
        // print('Bottom of the list is hidden');
        if (!showedScrollToBottomOverlay) {
          _showScrolltoBottomOverlay(context);
          showedScrollToBottomOverlay = true;
        }
      }

      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        // print('bottom');
        if (showedScrollToBottomOverlay) {
          _hideScrolltoBottomOverlay();
          showedScrollToBottomOverlay = false;
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: widget.name,
        onBackPressed: () {
          _disposeChatDataUsecase.execute();
          _router.maybePop();
        },
      ),
      body: _body,
    );
  }

  /// Widgets
  ///
  Widget get _body => BlocConsumer<ChatsBloc, ChatsState>(
        bloc: _chatsBloc,
        listener: _chatListeners,
        builder: (BuildContext context, ChatsState chatsState) {
          final List<ConversationsDto> conversationsList =
              chatsState.conversationsList;
          final ConversationsDataDto? conversations = chatsState.conversations;

          if (chatsState.stateStatus == StateStatus.loadingState) {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }

          if (conversationsList.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const EmptyListWidget(
                subTitle: 'Empty',
                title: 'Start Chat',
              ),
            );
          }

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: conversationsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String? currentUser =
                        _authBloc.state.loginDatas?.user.userName;

                    final bool isMe =
                        conversationsList[index].sender == currentUser;

                    final bool isLoading = conversations != null &&
                        conversations.currentPage != conversations.maxPage &&
                        conversationsList[conversationsList.length -
                                (conversationsList.length)] ==
                            conversationsList[index];

                    return Column(
                      children: <Widget>[
                        Visibility(
                          visible: isLoading,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator()),
                            ],
                          ),
                        ),
                        Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            children: <Widget>[
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                ),
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color:
                                      isMe ? Colors.blue : Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(12.0),
                                    topRight: const Radius.circular(12.0),
                                    bottomLeft: isMe
                                        ? const Radius.circular(12.0)
                                        : const Radius.circular(0.0),
                                    bottomRight: isMe
                                        ? const Radius.circular(0.0)
                                        : const Radius.circular(12.0),
                                  ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset:
                                          const Offset(0, 2), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Text(
                                  conversationsList[index].content,
                                  style: TextStyle(
                                    color: isMe ? Colors.white : Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              _buildMessageComposer,
            ],
          );
        },
      );

  Widget get _buildMessageComposer => Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Compose message ...',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  onSubmitted: _handleSubmitted,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _handleSubmitted(_textController.text);
                _scrollToBottom(1);
              },
            ),
          ],
        ),
      );

  /// Listeners
  ///
  _chatListeners(BuildContext context, ChatsState state) {
    if (state.stateStatus == StateStatus.errorState) {
      final snackBar = SnackBar(
        content: Text('${state.errorMessage}'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  /// Private Methods
  ///
  _getConversations(
    StateStatus stateStatus,
    GetConversationsDto getConversations,
  ) {
    _getConversationsUsecase.execute(
      stateStatus: stateStatus,
      getConversations: getConversations,
    );
  }

  void _getNextPage() {
    final ConversationsDataDto? conversations = _chatsBloc.state.conversations;
    final int currentPage = conversations?.currentPage ?? 0;
    final int maxPage = conversations?.maxPage ?? 0;
    if (currentPage != maxPage) {
      _getConversations(
          StateStatus.loadedState,
          GetConversationsDto(
            conversationsId: widget.conversationId,
            page: currentPage + 1,
          ));
    }
  }

  void _showScrolltoBottomOverlay(BuildContext context) {
    scrollToBottomOverlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: scrollToBottomOverlayOffset.dx,
        top: scrollToBottomOverlayOffset.dy,
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            scrollToBottomOverlayOffset += details.delta;
            scrollToBottomOverlayEntry.markNeedsBuild();
          },
          child: IconButton(
            color: Colors.blue,
            onPressed: () {
              _scrollToBottom(1);
            },
            icon: const Icon(Icons.arrow_downward),
          ),
        ),
      ),
    );
    final OverlayState overlay = Overlay.of(context);
    overlay.insert(scrollToBottomOverlayEntry);
  }

  void _hideScrolltoBottomOverlay() {
    scrollToBottomOverlayEntry.remove();
  }

  void _scrollToBottom(int duration) {
    print('dura $duration');
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeOut,
    );
  }

  void _keyboardAction() {
    if (isKeyboardVisible) {
      _scrollToBottom(1);
    }
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _sendChatChatUsecase.execute(
        recipient: widget.name,
        content: _textController.text,
      );
      _textController.clear();

      _scrollToBottom(1);
    }
  }
}
