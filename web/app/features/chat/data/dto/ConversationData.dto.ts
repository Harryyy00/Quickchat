import { ConversationDto } from "./Conversation.dto";

export class ConversationDataDto {
  constructor(
    public currentPage: number,
    public maxPage: number,
    public conversationList: ConversationDto[]
  ) {}
}
