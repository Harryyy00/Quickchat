import { Conversation } from "./Conversation.dto";

export class ConversationResultDto {
  constructor(
    public currentPage: number,
    public maxPage: number,
    public conversationList: Conversation[]
  ) {}
}
