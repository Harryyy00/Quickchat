import { ObjectId } from "mongodb";
import { ChatRepository } from "../../core/repository/Chat/ChatRepository";
import { ErrorResponse } from "../../core/entity/ErrorRespose.entity";
import { Either } from "../../utils/Either";
import { ConversationsResultDto } from "../../core/dto/Chat/ConversationsResult.dto";

export class GetConversationsUsecase {
  constructor(private chatRepository: ChatRepository) {}

  async execute({
    conversationsId,
    page,
  }: {
    conversationsId: ObjectId;
    page: number;
  }): Promise<Either<ErrorResponse, ConversationsResultDto>> {
    const result = await this.chatRepository.getConversations(
      conversationsId,
      page
    );
    return result;
  }
}
