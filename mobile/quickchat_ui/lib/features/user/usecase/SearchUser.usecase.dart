import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchUser.dto.dart';
import 'package:quickchat_ui/features/user/data/bloc/user_bloc.dart';

@injectable
class SearchUserUsecase {
  SearchUserUsecase({required this.userBloc});
  final UserBloc userBloc;

  void execute({
    required SearchUserDto searchUserDto,
  }) {
    userBloc.add(UserEvent.search(
      searchUserDto: searchUserDto,
    ));
  }
}
