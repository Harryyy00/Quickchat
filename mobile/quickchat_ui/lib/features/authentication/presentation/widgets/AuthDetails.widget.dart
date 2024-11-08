import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/authentication/presentation/widgets/AuthButton.widget.dart';
import 'package:quickchat_ui/features/authentication/usecase/logout_user.usecase.dart';
import 'package:quickchat_ui/features/chat/usecase/DisposeChatStream.usecase.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class AuthDetailsWidget extends StatefulWidget {
  const AuthDetailsWidget({super.key});

  @override
  State<AuthDetailsWidget> createState() => _AuthDetailsWidgetState();
}

class _AuthDetailsWidgetState extends State<AuthDetailsWidget> {
  late AuthBloc _authBloc;

  late LogoutUserUsecase _logoutUserUsecase;
  late DisposeChatStreamUsecase _disposeChatStreamUsecase;

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    _logoutUserUsecase = getIt<LogoutUserUsecase>();
    _disposeChatStreamUsecase = getIt<DisposeChatStreamUsecase>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState state) {
        final double width = MediaQuery.of(context).size.width;
        final String? name = state.loginDatas?.user.name;
        final String? namePrefix = state.loginDatas?.user.name.split('')[0];
        return Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Text(
                              namePrefix?.toUpperCase() ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          toBeginningOfSentenceCase(name) ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40, child: Icon(Icons.settings)),
                  ],
                ),
                const SizedBox(height: 40),
                AuthButtonWidget(
                  buttonName: 'Requests',
                  bgColor: Colors.redAccent,
                  buttonwidth: width,
                  isLoading: state.stateStatus == StateStatus.loadingState,
                  action: () {
                    _logoutUserUsecase.execute();
                    _disposeChatStreamUsecase.execute();
                  },
                ),
                const SizedBox(height: 10),
                AuthButtonWidget(
                  buttonName: 'Logout',
                  bgColor: Colors.grey,
                  buttonwidth: width,
                  isLoading: state.stateStatus == StateStatus.loadingState,
                  action: () {
                    _logoutUserUsecase.execute();
                    _disposeChatStreamUsecase.execute();
                  },
                ),
              ],
            ));
      },
    );
  }
}
