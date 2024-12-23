import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';

@injectable
class ConnectChatStreamUsecase {
  ConnectChatStreamUsecase({required this.chatBloc});
  final ChatsBloc chatBloc;

  void execute() {
    print('bubu');
    chatBloc.add(const ChatsEvent.connectChatStream());
  }
}
