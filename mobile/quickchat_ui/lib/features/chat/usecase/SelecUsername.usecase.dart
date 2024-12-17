import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';

@injectable
class SelectUsernameUsecase {
  SelectUsernameUsecase({required this.chatBloc});
  final ChatsBloc chatBloc;

  void execute({String? userName}) {
    if (userName != null) {
      chatBloc.add(ChatsEvent.selectUsername(
        userName: userName,
      ));
    } else {
      chatBloc.add(const ChatsEvent.unSelectUsername());
    }
  }
}
