// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/router/app_router.dart';
import 'package:quickchat_ui/core/widgets/templates/base_appbar.dart';
import 'package:quickchat_ui/core/widgets/templates/base_body.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversation.dto.dart';
import 'package:quickchat_ui/features/user/data/bloc/user_bloc.dart';

import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

@RoutePage()
class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late StackRouter _router;

  late UserBloc _userBloc;
  late ChatsBloc _chatsBloc;

  @override
  void initState() {
    _router = AutoRouter.of(context);

    _userBloc = getIt<UserBloc>();
    _chatsBloc = getIt<ChatsBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _userBloc,
        listener: _userListener,
        builder: (BuildContext context, UserState state) {
          if (state.stateStatus == StateStatus.loadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          return BaseBody(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2,
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.redAccent),
                        child: Column(
                          children: <Widget>[
                            _actions,
                            const SizedBox(height: 20),
                            _details(
                              state.selectedUser?.name ?? '',
                              state.selectedUser?.userName ?? '',
                            ),
                            const SizedBox(height: 20),
                            const Divider(
                              endIndent: 10,
                              indent: 10,
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'This user does not have any info yet',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          child: Icon(
                            FluentIcons.person_20_filled,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.redAccent),
    elevation: WidgetStateProperty.all<double?>(0),
    splashFactory: NoSplash.splashFactory,
  );

  TextStyle textStyle = const TextStyle(
    color: Colors.white,
  );

  Widget get _actions => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Feature not yet available'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(FluentIcons.people_12_filled, color: Colors.white),
            label: Text('Connect', style: textStyle),
            style: buttonStyle,
          ),
          ElevatedButton.icon(
            onPressed: () {
              final String userName =
                  _userBloc.state.selectedUser?.userName ?? '';
              ConversationDto? existingConversation;

              try {
                existingConversation = _chatsBloc.state.conversationList
                    .firstWhere((ConversationDto e) =>
                        e.sender == userName || e.recipient == userName);
              } catch (e) {
                existingConversation = null;
              }
              _router.push(ChatRoute(
                conversationId: existingConversation?.conversationsId ?? '',
                name: userName,
              ));
            },
            icon: const Icon(FluentIcons.chat_12_filled, color: Colors.white),
            label: Text('Message', style: textStyle),
            style: buttonStyle,
          ),
        ],
      );

  Widget _details(String name, String userName) => Column(
        children: [
          Text(
            toBeginningOfSentenceCase(name),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(userName, style: textStyle),
        ],
      );

  void _userListener(BuildContext context, UserState state) {}
}
