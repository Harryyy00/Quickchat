import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/core/scale/system_scale.dart';
import 'package:quickchat_ui/core/widgets/snackbars.widget.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/authentication/data/dto/RegisterUser.dto.dart';
import 'package:quickchat_ui/features/authentication/presentation/widgets/AuthButton.widget.dart';
import 'package:quickchat_ui/features/authentication/presentation/widgets/AuthForm.widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickchat_ui/features/authentication/usecase/get_credentials.usecase.dart';
import 'package:quickchat_ui/features/authentication/usecase/register_user.usecase.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.delay});

  final double? delay;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late StackRouter _router;

  late AuthBloc _authBloc;

  late RegisterUserUsecase _registerUserUsecase;
  late GetCredentialsUsecase _getCredentialsUsecase;

  late SystemScale _systemScale;

  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;
  late FocusNode _nameFocusNode;
  late FocusNode _userNameFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _repeatPasswordFocusNode;

  XFile? _profilePicture;
  final ImagePicker _picker = ImagePicker();

  late double width;
  late double height;

  bool isObscureFirst = true;
  bool isObscureSecond = true;

  @override
  void initState() {
    _router = AutoRouter.of(context);

    _authBloc = getIt<AuthBloc>();
    _registerUserUsecase = getIt<RegisterUserUsecase>();
    _getCredentialsUsecase = getIt<GetCredentialsUsecase>();
    _systemScale = getIt<SystemScale>();

    _nameController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    _nameFocusNode = FocusNode();
    _userNameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();

    super.dispose();
  }

  Future<void> _selectProfilePicture() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profilePicture = pickedFile;
    });
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
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          _router.maybePop();
                        },
                        child: const Text(
                          'Log in.',
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
              _profilePictureWidget(),
              const SizedBox(height: 16.0),
              AuthFormWidget(
                focusNode: _nameFocusNode,
                label: 'Name',
                controller: _nameController,
              ),
              const SizedBox(height: 16.0),
              AuthFormWidget(
                focusNode: _userNameFocusNode,
                label: 'Username',
                controller: _userNameController,
              ),
              const SizedBox(height: 16.0),
              AuthFormWidget(
                focusNode: _passwordFocusNode,
                label: 'Password',
                isPassword: isObscureFirst,
                controller: _passwordController,
                onTapPasswordIcon: () {
                  setState(() {
                    isObscureFirst = !isObscureFirst;
                  });
                },
                iconData:
                    isObscureFirst ? Icons.visibility : Icons.visibility_off,
              ),
              const SizedBox(height: 16.0),
              AuthFormWidget(
                focusNode: _repeatPasswordFocusNode,
                label: 'Repeat Password',
                isPassword: isObscureSecond,
                controller: _repeatPasswordController,
                onTapPasswordIcon: () {
                  setState(() {
                    isObscureSecond = !isObscureSecond;
                  });
                },
                iconData:
                    isObscureSecond ? Icons.visibility : Icons.visibility_off,
              ),
              const SizedBox(height: 16.0),
              AuthButtonWidget(
                buttonName: 'Register',
                bgColor: const Color(0xFF3897F0),
                buttonwidth: width,
                action: () {
                  if (_fieldsAreValid()) {
                    _registerUserUsecase.execute(RegisterUserDto(
                      name: _nameController.value.text,
                      username: _userNameController.value.text,
                      password: _passwordController.value.text,
                    ));
                  } else {
                    showIconSnackBar(
                      context,
                      'Please fill all required fields.',
                      const Icon(Icons.warning),
                      _systemScale,
                      backgroundColor: const Color(0xFF3897F0),
                    );
                    _focusFirstEmptyField();
                  }
                },
                isLoading: state.stateStatus == StateStatus.loadingState,
              ),
            ],
          );
        },
      );

  Widget _profilePictureWidget() {
    return GestureDetector(
      onTap: _selectProfilePicture,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _profilePicture != null
            ? Image.file(File(_profilePicture!.path)).image
            : const AssetImage('assets/images/user.png'),
        child: _profilePicture == null
            ? const Icon(Icons.add_a_photo, size: 30, color: Colors.white)
            : null,
      ),
    );
  }

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

    if (state.hasRegisteredUser) {
      _dialogBuilder(context);
    }
  }

  bool _fieldsAreValid() {
    return _nameController.value.text.isNotEmpty &&
        _userNameController.value.text.isNotEmpty &&
        _passwordController.value.text.isNotEmpty &&
        _repeatPasswordController.value.text == _passwordController.value.text;
  }

  void _focusFirstEmptyField() {
    if (_nameController.value.text.isEmpty) {
      _nameFocusNode.requestFocus();
    } else if (_userNameController.value.text.isEmpty) {
      _userNameFocusNode.requestFocus();
    } else if (_passwordController.value.text.isEmpty) {
      _passwordFocusNode.requestFocus();
    } else if (_repeatPasswordController.value.text !=
        _passwordController.value.text) {
      _repeatPasswordFocusNode.requestFocus();
    }
  }

  Future<void> _dialogBuilder(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account Created!'),
          content: const Text('A new account has been created\n'
              'do you want to auto log in?\n'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(false);
                _getCredentialsUsecase.execute();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                _nameController.clear();
                _userNameController.clear();
                _passwordController.clear();
                _repeatPasswordController.clear();
                _router.maybePop();
              },
            ),
          ],
        );
      },
    );
  }
}
