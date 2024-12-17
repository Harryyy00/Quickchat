import { ConversationsDto } from "./Conversations.dto";

export class ConversationsDataDto {
  constructor(
    public currentPage: number,
    public maxPage: number,
    public conversationsList: ConversationsDto[]
  ) {}
}
