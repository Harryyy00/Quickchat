import { Conversation } from "../../core/dto/Chat/Conversation.dto";
import { ConversationResultDto } from "../../core/dto/Chat/ConversationResult.dto";
import { ErrorResponse } from "../../core/entity/ErrorRespose.entity";
import { ChatRepository } from "../../core/repository/Chat/ChatRepository";
import { Either } from "../../utils/Either";

export class GetConversationUsecase {
  constructor(private chatRepository: ChatRepository) {}

  async execute({
    userName,
    page,
  }: {
    userName: string;
    page: number;
  }): Promise<Either<ErrorResponse, ConversationResultDto>> {
    const result = await this.chatRepository.getConversation(userName, page);
    return result;
  }
}
