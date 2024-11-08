import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';

@injectable
class GetConversationUsecase {
  GetConversationUsecase({required this.chatBloc});
  final ChatsBloc chatBloc;

  void execute({
    required StateStatus stateStatus,
    required int page,
  }) {
    chatBloc.add(ChatsEvent.getConversation(
      stateStatus: stateStatus,
      page: page,
    ));
  }
}
