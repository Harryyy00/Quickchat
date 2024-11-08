import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';

@injectable
class SendChatChatUsecase {
  SendChatChatUsecase({required this.chatBloc});
  final ChatsBloc chatBloc;

  void execute({
    required String recipient,
    required String content,
  }) {
    chatBloc.add(ChatsEvent.sendChat(
      recipient: recipient,
      content: content,
    ));
  }
}
