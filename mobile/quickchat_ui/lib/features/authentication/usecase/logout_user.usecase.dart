import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/authentication/data/bloc/auth_bloc.dart';

@injectable
class LogoutUserUsecase {
  LogoutUserUsecase({required this.authBloc});

  final AuthBloc authBloc;

  void execute() {
    authBloc.add(const AuthEvent.logoutUser());
  }
}
