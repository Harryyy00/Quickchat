import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/router/app_router.dart';
import 'package:quickchat_ui/core/widgets/templates/base_body.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/UserData.dto.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversation.dto.dart';
import 'package:quickchat_ui/features/user/data/bloc/user_bloc.dart';
import 'package:quickchat_ui/features/user/presentation/widgets/UserItem.widget.dart';
import 'package:quickchat_ui/features/user/usecase/GetUser.usecase.dart';
import 'package:quickchat_ui/features/user/usecase/SearchUser.usecase.dart';

@RoutePage()
class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late StackRouter _router;

  late AuthBloc _authBloc;
  late UserBloc _userBloc;
  late ChatsBloc _chatsBloc;

  late SearchUserUsecase _searchUserUsecase;
  late GetUserUsecase _getUserUsecase;

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? debounce;

  @override
  void initState() {
    _router = AutoRouter.of(context);

    _authBloc = getIt<AuthBloc>();
    _userBloc = getIt<UserBloc>();
    _chatsBloc = getIt<ChatsBloc>();

    _searchUserUsecase = getIt<SearchUserUsecase>();
    _getUserUsecase = getIt<GetUserUsecase>();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollControllerListener();
    return BlocConsumer<UserBloc, UserState>(
      bloc: _userBloc,
      listener: _userListener,
      builder: (BuildContext context, UserState state) {
        return BaseBody(
          child: Center(
              child: Column(
            children: <Widget>[
              _searchBar,
              if (state.searchList.isEmpty &&
                  state.stateStatus == StateStatus.loadedState)
                _empty,
              if (state.stateStatus == StateStatus.loadingState) _loading,
              if (state.stateStatus == StateStatus.loadedState) _searchResults,
            ],
          )),
        );
      },
    );
  }

  Widget get _empty => const Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FluentIcons.folder_open_16_regular,
                color: Colors.black38,
                size: 60,
              ),
              Text(
                'Empty',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              )
            ],
          ),
        ),
      );

  Widget get _loading => const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

  Widget get _searchBar => Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: TextField(
          controller: _searchController,
          // onChanged: onQueryChanged,
          onSubmitted: onQueryChanged,
          decoration: const InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      );

  Widget get _searchResults => BlocConsumer<UserBloc, UserState>(
        bloc: _userBloc,
        listener: _userListener,
        builder: (BuildContext context, UserState userState) {
          final List<UserDataDto> list = userState.searchList.toList();

          /// remove logged user from the list
          list.remove(_authBloc.state.loginDatas?.user);
          return Visibility(
            visible: userState.stateStatus != StateStatus.loadingState,
            child: Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final String userId = list[index].id;
                  final String name = list[index].name;
                  final String userName = list[index].userName;
                  final bool isLoading = userState.search?.currentPage !=
                          userState.search?.maxPage &&
                      list[list.length - 1] == list[index];

                  return UserItemWidget(
                    onTap: () {
                      _getUserUsecase.execute(
                        stateStatus: StateStatus.loadingState,
                        userId: userId,
                      );
                      _router.push(UserDetailsRoute(userId: userId));
                    },
                    ontapMessage: () {
                      ConversationDto? existingConversation;

                      try {
                        existingConversation = _chatsBloc.state.conversationList
                            .firstWhere((ConversationDto e) =>
                                e.sender == userName ||
                                e.recipient == userName);
                      } catch (e) {
                        existingConversation = null;
                      }
                      _router.push(ChatRoute(
                        conversationId:
                            existingConversation?.conversationsId ?? '',
                        name: userName,
                      ));
                    },
                    name: name,
                    username: userName,
                    isLoading: isLoading,
                  );
                },
              ),
            ),
          );
        },
      );

  void onQueryChanged(String newQuery) {
    // if (debounce != null && debounce!.isActive) {
    //   debounce!.cancel();

    //   debounce =
    //       Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
    _search(SearchUserDto(
      stateStatus: StateStatus.loadingState,
      querySearch: newQuery,
      page: 1,
    ));

    //     timer.cancel();
    //   });
    // }
  }

  void _scrollControllerListener() {
    _scrollController.addListener(() {
      final int currentPage = _userBloc.state.search?.currentPage ?? 0;
      final int maxPage = _userBloc.state.search?.maxPage ?? 0;
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange &&
          currentPage != maxPage) {
        _search(SearchUserDto(
          stateStatus: StateStatus.loadedState,
          querySearch: _searchController.text,
          page: currentPage + 1,
        ));
      }
    });
  }

  _search(SearchUserDto searchUserDto) {
    _searchUserUsecase.execute(
      searchUserDto: SearchUserDto(
        stateStatus: searchUserDto.stateStatus,
        querySearch: searchUserDto.querySearch,
        page: searchUserDto.page,
      ),
    );
  }

  void _userListener(BuildContext context, UserState state) {}
}
