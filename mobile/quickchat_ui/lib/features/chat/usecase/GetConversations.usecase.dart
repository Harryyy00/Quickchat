import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/features/chat/data/bloc/chat_bloc.dart';
import 'package:quickchat_ui/features/chat/data/dto/GetConversations.dto.dart';

@injectable
class GetConversationsUsecase {
  GetConversationsUsecase({required this.chatBloc});
  final ChatsBloc chatBloc;

  void execute({
    required StateStatus stateStatus,
    required GetConversationsDto getConversations,
  }) {
    chatBloc.add(ChatsEvent.getConversations(
      stateStatus: stateStatus,
      getConversations: getConversations,
    ));
  }
}
