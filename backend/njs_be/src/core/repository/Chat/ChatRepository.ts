import { ObjectId } from "mongodb";
import { Conversation } from "../../dto/Chat/Conversation.dto";
import { MessageDto } from "../../dto/Chat/Message.dto";
import { ErrorResponse } from "../../entity/ErrorRespose.entity";
import { ConversationsResultDto } from "../../dto/Chat/ConversationsResult.dto";
import { Either } from "../../../utils/Either";
import { ConversationResultDto } from "../../dto/Chat/ConversationResult.dto";

export interface ChatRepository {
  sendMessage(messageDto: MessageDto): Promise<Either<ErrorResponse, ObjectId>>;
  getConversation(
    userName: string,
    page: number
  ): Promise<Either<ErrorResponse, ConversationResultDto>>;
  getConversations(
    conversationsId: ObjectId,
    page: number
  ): Promise<Either<ErrorResponse, ConversationsResultDto>>;
}
