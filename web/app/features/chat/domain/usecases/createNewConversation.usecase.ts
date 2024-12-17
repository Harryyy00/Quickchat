import { createNewConversation, sendMessage } from "../../data/redux/chatSlice";

export class CreateNewConversationUsecase {
  async execute(
    {
      userName,
    }: {
      userName: string;
    },
    dispatch: any
  ): Promise<void> {
    dispatch(createNewConversation(userName));
  }
}
