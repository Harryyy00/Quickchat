import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/features/user/data/bloc/user_bloc.dart';

@injectable
class GetUserUsecase {
  GetUserUsecase({required this.userBloc});
  final UserBloc userBloc;

  void execute({
    required StateStatus stateStatus,
    required String userId,
  }) {
    userBloc.add(UserEvent.getUser(
      stateStatus: stateStatus,
      userId: userId,
    ));
  }
}
