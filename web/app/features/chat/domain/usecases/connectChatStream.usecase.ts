import { connectChatStream } from "../../data/redux/chatSlice";

export class ConnectChatStreamUsecase {
  async execute(dispatch: any): Promise<void> {
    console.log("STREAM CALLED");
    dispatch(connectChatStream());
  }
}
