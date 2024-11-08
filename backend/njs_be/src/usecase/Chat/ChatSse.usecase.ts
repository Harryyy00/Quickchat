import { Response } from "express";
import { ErrorResponse } from "../../core/entity/ErrorRespose.entity";
import { Either, isRight, makeLeft, makeRight } from "../../utils/Either";
import { ChatRepository } from "../../core/repository/Chat/ChatRepository";
import { MessageDto } from "../../core/dto/Chat/Message.dto";
import { ObjectId } from "mongodb";
import { stringify } from "querystring";

export class ChatSseUsecase {
  private clients: Map<string, Response[]> = new Map();

  async addClient({
    username,
    client,
  }: {
    username: string;
    client: Response;
  }) {
    if (!this.clients.has(username)) {
      this.clients.set(username, []);
    }
    this.clients.get(username)?.push(client);
  }

  async removeClient(username: string, client: Response) {
    const userClients = this.clients.get(username);
    if (userClients) {
      this.clients.set(
        username,
        userClients.filter((c: Response) => c !== client)
      );
      if (this.clients.get(username)?.length === 0) {
        this.clients.delete(username);
      }
    }
  }

  async sendMessage({
    message,
  }: {
    message: MessageDto;
  }): Promise<Either<ErrorResponse, String>> {
    const { sender, recipient, sentAt, content } = message;

    try {
      // Send message to the recipient
      const recipientClients = this.clients.get(recipient);
      // Send message to the sender
      const senderClients = this.clients.get(sender);

      // const result = await this.chatRepository.sendMessage(message);

      // if (isRight(result)) {
      // const id = makeRight(result).right.right;
      if (recipientClients) {
        recipientClients.forEach((client: Response) => {
          client.write(
            `data: ${JSON.stringify({
              // id,
              sender,
              recipient,
              sentAt,
              content,
            })}\n\n`
          );
        });
      }

      if (senderClients) {
        senderClients.forEach((client: Response) => {
          client.write(
            `data: ${JSON.stringify({
              // id,
              sender,
              recipient,
              sentAt,
              content,
            })}\n\n`
          );
        });
      }
      return makeRight("sent");
      // }
    } catch (e) {
      let errorResponse!: ErrorResponse;
      errorResponse = {
        statusCode: 404,
        errorMessage: e === "string" ? e : "something went wrong",
      };
      return makeLeft(errorResponse);
    }
  }
}
