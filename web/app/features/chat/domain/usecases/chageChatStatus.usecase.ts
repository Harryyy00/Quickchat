import { changeChatStatus } from "../../data/redux/chatSlice";

export class ChangeChatStatusUsecase {
  async execute(dispatch: any): Promise<void> {
    dispatch(changeChatStatus());
  }
}
