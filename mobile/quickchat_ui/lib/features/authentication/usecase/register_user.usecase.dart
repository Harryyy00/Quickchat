import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';
import 'package:quickchat_ui/features/authentication/data/dto/RegisterUser.dto.dart';

@injectable
class RegisterUserUsecase {
  RegisterUserUsecase({required this.authBloc});

  final AuthBloc authBloc;

  void execute(RegisterUserDto req) {
    authBloc.add(AuthEvent.registerUser(registerUserDto: req));
  }
}
