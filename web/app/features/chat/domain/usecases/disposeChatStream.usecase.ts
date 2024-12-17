import { AppDispatch } from "@/app/store";
import { disposeChatStream, getConversation } from "../../data/redux/chatSlice";

export class DisposeChatStreamUsecase {
  async execute(dispatch: AppDispatch): Promise<void> {
    dispatch(disposeChatStream());
  }
}
