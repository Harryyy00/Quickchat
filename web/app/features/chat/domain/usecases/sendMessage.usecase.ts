import { sendMessage } from "../../data/redux/chatSlice";

export class SendMessageUsecase {
  async execute(
    {
      recipient,
      content,
    }: {
      recipient: string;
      content: string;
    },
    dispatch: any
  ): Promise<void> {
    console.log("called");
    dispatch(sendMessage({ recipient, content }));
  }
}
