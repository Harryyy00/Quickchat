import { Collection, ObjectId } from "mongodb";
import { ChatRepository } from "../../../core/repository/Chat/ChatRepository";
import { Conversation } from "../../../core/dto/Chat/Conversation.dto";
import { Conversations } from "../../../core/dto/Chat/Conversations.dto";
import { getDatabase } from "../../../middleware/MongoDB";
import { ErrorResponse } from "../../../core/entity/ErrorRespose.entity";
import { MessageDto } from "../../../core/dto/Chat/Message.dto";
import { Either, makeLeft, makeRight } from "../../../utils/Either";
import { ConversationsResultDto } from "../../../core/dto/Chat/ConversationsResult.dto";
import { ConversationResultDto } from "../../../core/dto/Chat/ConversationResult.dto";

export class ChatRepositoryImpl implements ChatRepository {
  private conversationCollection: Collection<Conversation> =
    getDatabase().collection("Conversation");
  private conversationsCollection: Collection<Conversations> =
    getDatabase().collection("Conversations");
  private userCollection = getDatabase().collection("Users");

  async sendMessage(
    messageDto: MessageDto
  ): Promise<Either<ErrorResponse, ObjectId>> {
    let errorResponse!: ErrorResponse;

    // Check if both sender and recipient are valid users
    const sender = await this.userCollection.findOne({
      userName: messageDto.sender,
    });
    const recipient = await this.userCollection.findOne({
      userName: messageDto.recipient,
    });

    if (!sender || !recipient) {
      errorResponse = {
        statusCode: 400,
        errorMessage: `${!sender ? "Sender" : "Recipient"} is invalid`,
      };
      return makeLeft(errorResponse);
    }

    // sender is sender
    const senderConvo = await this.conversationCollection.findOne({
      sender: messageDto.sender,
      recipient: messageDto.recipient,
    });

    // recipient is sender
    const recipientConvo = await this.conversationCollection.findOne({
      sender: messageDto.recipient,
      recipient: messageDto.sender,
    });

    // Checking if there's an existing record of the two users
    const existingConversation = senderConvo || recipientConvo;

    const conversationId = senderConvo?._id ?? recipientConvo?._id;

    // Updating the existing conversation
    if (existingConversation) {
      try {
        // find conversation with conversationId
        const result = await this.conversationCollection.findOne({
          _id: conversationId,
        });

        // update the conversations with the conversationsId property
        await this.conversationsCollection.updateOne(
          {
            _id: result?.conversationsId,
          },
          { $push: { conversationsList: messageDto } }
        );

        const findLastConversationId =
          await this.conversationsCollection.findOne({
            _id: new ObjectId(result?.conversationsId),
          });

        const lastConversation =
          findLastConversationId?.conversationsList.slice(-1)[0];

        const lastConversationId = lastConversation?._id;

        // update the last message
        await this.conversationCollection.updateOne(
          {
            _id: conversationId,
          },
          {
            $set: {
              lastMessage: messageDto.content,
              timeStamp: messageDto.sentAt,
            },
          }
        );
        return makeRight(new ObjectId(lastConversationId));
      } catch (e) {
        errorResponse = {
          statusCode: 500,
          errorMessage: `Message Not Sent! : ${e}`,
        };
        return makeLeft(errorResponse);
      }
    }

    // Create a new conversation
    try {
      // find conversation with conversationId
      const res = await this.conversationCollection.findOne({
        _id: conversationId,
      });
      const conversationsData: Conversations = {
        conversationsList: [messageDto],
      };
      const result = await this.conversationsCollection.insertOne(
        conversationsData
      );
      const conversationData: Conversation = {
        sender: messageDto.sender,
        recipient: messageDto.recipient,
        timeStamp: messageDto.sentAt,
        lastMessage: messageDto.content,
        conversationsId: result.insertedId,
      };
      await this.conversationCollection.insertOne(conversationData);

      const findLastConversationId = await this.conversationsCollection.findOne(
        {
          _id: new ObjectId(res?.conversationsId),
        }
      );

      const lastConversation =
        findLastConversationId?.conversationsList.slice(-1)[0];

      const lastConversationId = lastConversation?._id;
      return makeRight(new ObjectId(lastConversationId));
    } catch (e) {
      errorResponse = {
        statusCode: 500,
        errorMessage: `Message Not Sent! : ${e}`,
      };
      return makeLeft(errorResponse);
    }
  }

  async getConversation(
    userName: string,
    page: number,
    pageSize: number = 20 // Default page size
  ): Promise<Either<ErrorResponse, ConversationResultDto>> {
    let conversationResult: ConversationResultDto;
    let errorResponse!: ErrorResponse;

    try {
      // Fetch conversations where the user is the sender or recipient
      const foundConversation = await this.conversationCollection
        .find({
          $or: [{ sender: userName }, { recipient: userName }],
        })
        .sort({ timeStamp: -1 }) // Sort by timeStamp in descending order
        .toArray();

      const totalItems = foundConversation.length;
      const maxPage = Math.ceil(totalItems / pageSize);

      // If the requested page number exceeds the maximum pages, return an error response
      if (page > maxPage) {
        errorResponse = {
          statusCode: 404,
          errorMessage: "Page number exceeds maximum pages",
        };
        return makeLeft(errorResponse);
      }

      // Calculate the starting index for the current page
      const skip = (page - 1) * pageSize;

      const pagedConversationList = foundConversation
        .slice(skip, skip + pageSize)
        .map(
          (conversation: Conversation) =>
            new Conversation(
              conversation.sender,
              conversation.recipient,
              conversation.conversationsId,
              new Date(conversation.timeStamp), // Convert timeStamp to Date object
              conversation.lastMessage
            )
        );

      // Create the result object with the current page, maxPage, and paged conversation list
      conversationResult = {
        currentPage: page,
        maxPage: maxPage,
        conversationList: pagedConversationList,
      };

      return makeRight(conversationResult);
    } catch (error) {
      errorResponse = {
        statusCode: 404,
        errorMessage: `An error occurred while retrieving conversation: ${error}`,
      };
      return makeLeft(errorResponse);
    }
  }

  async getConversations(
    conversationsId: ObjectId,
    page: number,
    pageSize: number = 20 // Default page size
  ): Promise<Either<ErrorResponse, ConversationsResultDto>> {
    let conversationsResult: ConversationsResultDto;
    let errorResponse!: ErrorResponse;

    // Convert the input conversationsId to an ObjectId instance
    const finalConversationsId = new ObjectId(conversationsId);

    try {
      // Fetch the conversation document from the collection using the finalConversationsId
      const conversation = await this.conversationsCollection.findOne({
        _id: finalConversationsId,
      });

      // If the conversation document is not found, return an error response
      if (!conversation) {
        errorResponse = {
          statusCode: 404,
          errorMessage: "Conversations Record Not Found!",
        };
        return makeLeft(errorResponse);
      }

      // Reverse the conversation list to have the latest messages first
      const reversedConversationsList =
        conversation.conversationsList.reverse();

      // Calculate the total number of items and the maximum number of pages
      const totalItems = reversedConversationsList.length;
      const maxPage = Math.ceil(totalItems / pageSize);

      // If the requested page number exceeds the maximum pages, return an error response
      if (page > maxPage) {
        errorResponse = {
          statusCode: 404,
          errorMessage: "Page number exceeds maximum pages",
        };
        return makeLeft(errorResponse);
      }

      // Calculate the starting index for the current page
      const skip = (page - 1) * pageSize;

      // Slice the conversationsList to get only the items for the current page
      const pagedConversationsList = conversation.conversationsList
        .slice(skip, skip + pageSize)
        .map(
          (message: any) =>
            new MessageDto(
              message._id,
              message.sender,
              message.recipient,
              new Date(message.sentAt), // Convert sentAt to Date object
              message.content,
              message._id
            )
        );

      // Create the result object with the current page, maxPage, and paged conversation list
      conversationsResult = {
        currentPage: page,
        maxPage: maxPage,
        conversationsList: pagedConversationsList.reverse(),
      };

      // Return the result object
      return makeRight(conversationsResult);
    } catch (error) {
      // In case of any error, create and return an error response with status code 500
      errorResponse = {
        statusCode: 500,
        errorMessage: `An error occurred while retrieving conversations: ${error}`,
      };
      return makeLeft(errorResponse);
    }
  }
}
