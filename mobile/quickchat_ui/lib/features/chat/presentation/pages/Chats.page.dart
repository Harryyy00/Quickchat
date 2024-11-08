import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/router/app_router.dart';
import 'package:quickchat_ui/core/utils/date_utils.dart';
import 'package:quickchat_ui/core/widgets/templates/base_body.dart';
import 'package:quickchat_ui/core/widgets/templates/empty_list_widget.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversation.dto.dart';
import 'package:quickchat_ui/features/chat/presentation/widgets/ConversationItem.widget.dart';
import 'package:quickchat_ui/features/chat/usecase/ConnectChatStream.usecase.dart';
import 'package:quickchat_ui/features/chat/usecase/DisposeChatStream.usecase.dart';
import 'package:quickchat_ui/features/chat/usecase/GetConversation.usecase.dart';

@RoutePage()
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  late ChatsBloc _chatsBloc;
  late AuthBloc _authBloc;

  late GetConversationUsecase _getConversationUsecase;
  late ConnectChatStreamUsecase _connectChatStreamUsecase;
  late DisposeChatStreamUsecase _disposeChatStreamUsecase;

  late StackRouter _router;

  late QCDateUtils _qcDateUtils;

  bool _isLoading = true;

  @override
  void initState() {
    _chatsBloc = getIt<ChatsBloc>();
    _authBloc = getIt<AuthBloc>();

    _getConversationUsecase = getIt<GetConversationUsecase>();
    _connectChatStreamUsecase = getIt<ConnectChatStreamUsecase>();
    _disposeChatStreamUsecase = getIt<DisposeChatStreamUsecase>();

    _router = AutoRouter.of(context);

    _qcDateUtils = getIt<QCDateUtils>();

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });

    _getConversation(stateStatus: StateStatus.loadingState, page: 1);

    super.initState();
  }

  @override
  void dispose() {
    _disposeChatStreamUsecase.execute();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBody(
      child: _list,
    );
  }

  Widget get _list {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState authState) {
        return BlocConsumer<ChatsBloc, ChatsState>(
          bloc: _chatsBloc,
          listener: _chatListener,
          builder: (BuildContext context, ChatsState chatsState) {
            final List<ConversationDto> conversationList =
                chatsState.conversationList;

            if (_isLoading ||
                chatsState.stateStatus == StateStatus.loadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }

            if (conversationList.isEmpty) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const EmptyListWidget(
                    subTitle: 'Empty',
                    title: 'No Messages',
                  ),
                ),
              );
            }

            return RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView(
                  children: [
                    ...conversationList.map((ConversationDto e) {
                      final String timeStamp =
                          _qcDateUtils.getDateTimeAgo(e.timeStamp);
                      final List<String> userName = [e.recipient, e.sender];
                      userName.remove(authState.loginDatas?.user.userName);
                      return ConversationItemWidget(
                        lastMessage: e.lastMessage,
                        userName: userName[0],
                        timeStamp: timeStamp,
                        profilePicBlob: 'sdsd',
                        onTap: () {
                          _router.push(ChatRoute(
                            conversationId: e.conversationsId,
                            name: userName[0],
                          ));
                        },
                      );
                    }),
                  ],
                ));
          },
        );
      },
    );
  }

  /// Listeners
  ///
  void _chatListener(BuildContext context, ChatsState state) {
    if (state.stateStatus == StateStatus.errorState) {
      final snackBar = SnackBar(
        content: Text('${state.errorMessage}'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (state.isConversationLoaded) {
      _connectChatStreamUsecase.execute();
    }
  }

  /// Private Methods
  ///
  Future<void> _onRefresh() async {
    _getConversation(stateStatus: StateStatus.loadingState, page: 1);
  }

  void _getConversation({required StateStatus stateStatus, required int page}) {
    _getConversationUsecase.execute(stateStatus: stateStatus, page: page);
  }
}
