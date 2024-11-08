import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';

@injectable
class DisposeChatDataUsecase {
  DisposeChatDataUsecase({required this.chatBloc});
  final ChatsBloc chatBloc;

  void execute() {
    chatBloc.add(const ChatsEvent.disposeChatData());
  }
}
