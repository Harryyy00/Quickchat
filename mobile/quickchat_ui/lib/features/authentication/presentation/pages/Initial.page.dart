import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/auth_status.dart';
import 'package:quickchat_ui/core/logic/navigate_page.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/router/app_router.dart';
import 'package:quickchat_ui/core/utils/custom_color.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/authentication/usecase/connect_server.usecase.dart';
import 'package:quickchat_ui/features/authentication/usecase/segment/dispose_segment_listener.dart';
import 'package:quickchat_ui/features/authentication/usecase/segment/listen_segment_stream.dart';

@RoutePage()
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late AuthBloc _authBloc;

  late ListenSegmentStreamUsecase _listenSegmentStreamUsecase;
  late DisposeSegmentListenerUsecase _disposeSegmentListenerUsecase;
  late ConnectServerUsecase _connectServerUsecase;

  late StackRouter _router;

  @override
  void initState() {
    _router = AutoRouter.of(context);
    _authBloc = getIt<AuthBloc>();

    _listenSegmentStreamUsecase = getIt<ListenSegmentStreamUsecase>();
    _disposeSegmentListenerUsecase = getIt<DisposeSegmentListenerUsecase>();
    _connectServerUsecase = getIt<ConnectServerUsecase>();

    _listenSegmentStreamUsecase.execute(context);
    _connectServerUsecase.execute();

    super.initState();
  }

  @override
  void dispose() {
    _disposeSegmentListenerUsecase.execute();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Colors.white,
            Colors.white,
          ])),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocListener<AuthBloc, AuthState>(
            bloc: _authBloc,
            listener: _authListener,
            child: _loading,
          ),
        ),
      ),
    );
  }

  Widget get _loading => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: _connectlyImg,
            ),
            const CupertinoActivityIndicator(
              color: CustomColor.instagramWhite,
            )
          ],
        ),
      );

  Widget get _connectlyImg => Image.asset(
        'assets/images/qc_logo.png',
        scale: 3,
      );

  void _authListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.errorState) {}

    if (state.stateStatus == StateStatus.loadedState) {
      if (state.navigatePage == NavigatePage.loginPage &&
          state.authStatus == AuthStatus.unauthenticated) {
        print('yohoo');
        _router.popAndPush(LoginRoute(delay: 2));
      }
    }

    if (state.navigatePage == NavigatePage.homePage &&
        state.authStatus == AuthStatus.authenticated) {
      _router.popAndPush(const HomeRoute());
    }
  }
}
