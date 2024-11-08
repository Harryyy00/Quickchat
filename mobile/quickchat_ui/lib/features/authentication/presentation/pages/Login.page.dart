import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/router/app_router.dart';
import 'package:quickchat_ui/core/scale/system_scale.dart';
import 'package:quickchat_ui/core/widgets/snackbars.widget.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:quickchat_ui/features/authentication/presentation/widgets/AuthButton.widget.dart';
import 'package:quickchat_ui/features/authentication/presentation/widgets/AuthForm.widget.dart';
// import 'package:quickchat_ui/features/authentication/usecase/auto_login.usecase.dart';
import 'package:quickchat_ui/features/authentication/usecase/login_user.usecase.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.delay});

  final double? delay;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthBloc _authBloc;

  late LoginUserUsecase _loginUserUsecase;
  // late AutoLoginUserUsecase _autoLoginUserUsecase;

  late StackRouter _router;

  late SystemScale _systemScale;

  late TextEditingController _userNameCotroller;
  late TextEditingController _passwordControler;
  late FocusNode _userNameFocusNode;
  late FocusNode _passwordFocusNode;
  late double width;
  late double height;

  bool isObscure = true;

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();

    _loginUserUsecase = getIt<LoginUserUsecase>();
    // _autoLoginUserUsecase = getIt<AutoLoginUserUsecase>();

    _systemScale = getIt<SystemScale>();

    _userNameCotroller = TextEditingController();
    _passwordControler = TextEditingController();
    _userNameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    _router = AutoRouter.of(context);
    // _autoLoginUserUsecase.execute();
    super.initState();
  }

  @override
  void dispose() {
    _userNameCotroller.dispose();
    _passwordControler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _header,
                const SizedBox(height: 40.0),
                _form,
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      child: TextButton(
                        onPressed: () => _router.push(RegisterRoute()),
                        child: const Text(
                          'Sign up.',
                          style: TextStyle(
                            color: Color(0xFF3897F0),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _form => BlocConsumer<AuthBloc, AuthState>(
        listener: _authListener,
        bloc: _authBloc,
        builder: (BuildContext context, AuthState state) {
          return Column(
            children: [
              AuthFormWidget(
                focusNode: _userNameFocusNode,
                label: 'Username',
                controller: _userNameCotroller,
              ),
              const SizedBox(height: 16.0),
              AuthFormWidget(
                focusNode: _passwordFocusNode,
                label: 'Password',
                isPassword: isObscure,
                controller: _passwordControler,
                onTapPasswordIcon: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                iconData: isObscure ? Icons.visibility : Icons.visibility_off,
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFF3897F0),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              AuthButtonWidget(
                buttonName: 'Login',
                bgColor: const Color(0xFF3897F0),
                buttonwidth: width,
                action: () {
                  if (_userNameCotroller.value.text.isNotEmpty &&
                      _passwordControler.value.text.isNotEmpty) {
                    _loginUserUsecase.execute(LoginUserDto(
                      username: _userNameCotroller.value.text,
                      password: _passwordControler.value.text,
                    ));
                  } else {
                    showIconSnackBar(
                      context,
                      'Please fill all required fields.',
                      const Icon(Icons.warning),
                      _systemScale,
                      backgroundColor: const Color(0xFF3897F0),
                    );

                    _userNameCotroller.value.text.isEmpty
                        ? _userNameFocusNode.requestFocus()
                        : _passwordFocusNode.requestFocus();
                  }
                },
                isLoading: state.stateStatus == StateStatus.loadingState,
              ),
            ],
          );
        },
      );

  Widget get _header => Image.asset(
        'assets/images/qc_logo.png',
        scale: 3,
      );

  void _authListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.errorState) {
      final snackBar = SnackBar(
        content: Text('${state.errorMessage}'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
