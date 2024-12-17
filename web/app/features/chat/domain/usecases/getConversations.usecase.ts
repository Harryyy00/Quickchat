import { StateStatus } from "@/app/core/types";
import { getConversations } from "../../data/redux/chatSlice";
import { GetConversationsDto } from "../../data/dto/GetConversations.dto";

export class GetConversationsUsecase {
  async execute(
    {
      stateStatus,
      getConversationsDto,
    }: {
      stateStatus: StateStatus;
      getConversationsDto: GetConversationsDto;
    },
    dispatch: any
  ): Promise<void> {
    dispatch(getConversations({ stateStatus, getConversationsDto }));
  }
}
