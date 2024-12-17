import { GetConversationParamDto } from "../../data/dto/GetConversation.dto";
import { AppDispatch } from "@/app/store";
import { getConversation } from "../../data/redux/chatSlice";
import { StateStatus } from "@/app/core/types";

export class GetConversationUsecase {
  async execute(
    {
      stateStatus,
      getConversationParamDto,
    }: {
      stateStatus: StateStatus;
      getConversationParamDto: GetConversationParamDto;
    },
    dispatch: AppDispatch
  ): Promise<void> {
    console.log({ getConversationParamDto, stateStatus });

    dispatch(getConversation({ getConversationParamDto, stateStatus }));
  }
}
