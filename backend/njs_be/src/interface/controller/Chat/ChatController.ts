import Joi from "joi";
import objectId from "../../../utils/ObjectId";
import { Request, Response } from "express";
import { Either, isRight, unwrapEither } from "../../../utils/Either";
import { ObjectId } from "mongodb";
import { ChatSseUsecase } from "../../../usecase/Chat/ChatSse.usecase";
import { MessageDto } from "../../../core/dto/Chat/Message.dto";
import { ErrorResponse } from "../../../core/entity/ErrorRespose.entity";
import { Conversation } from "../../../core/dto/Chat/Conversation.dto";
import { ConversationsResultDto } from "../../../core/dto/Chat/ConversationsResult.dto";
import { GetConversationUsecase } from "../../../usecase/Chat/GetConversation.usecase";
import { GetConversationsUsecase } from "../../../usecase/Chat/GetConversations.usecase";
import { ConversationResultDto } from "../../../core/dto/Chat/ConversationResult.dto";

export class ChatController {
  constructor(
    private chatSseUsecase: ChatSseUsecase
  ) // private getConversationUsecase: GetConversationUsecase,
  // private getConversationsUsecase: GetConversationsUsecase
  {}

  sse(req: Request, res: Response) {
    const username = (req as any).user.userName;
    res.setHeader("Content-Type", "text/event-stream");
    res.setHeader("Cache-Control", "no-cache");
    res.setHeader("Connection", "keep-alive");
    res.flushHeaders();

    // add the client to the list of active clients
    this.chatSseUsecase.addClient({ username: username, client: res });

    // setup a ping to send every second to keep the connection alive
    // setInterval(() => {
    //   res.write(
    //     `data: ${JSON.stringify({ ping: new Date().getSeconds() })}\n\n`
    //   );
    // }, 2000);

    req.on("close", () => {
      this.chatSseUsecase.removeClient(username, res);
    });
  }

  async sendMessage(req: Request, res: Response) {
    const { recipient, content } = req.body;
    const sender = (req as any).user.userName;
    let sendAt = new Date();

    const message: MessageDto = {
      sender: sender,
      recipient: recipient,
      sentAt: sendAt,
      content: content,
      _id: new ObjectId(),
    };

    let result: Either<ErrorResponse, String>;

    result = await this.chatSseUsecase.sendMessage({ message: message });

    if (isRight(result)) {
      const data = unwrapEither(result);
      res.status(201).send({ data: data });
      return;
    }

    const error = unwrapEither(result);
    res.status(error.statusCode).send({ errors: error });
    return;
  }

  // async getConversation(req: Request, res: Response) {
  //   const schema = Joi.object({
  //     page: Joi.number().required(),
  //   });

  //   const userName = (req as any).user.username;

  //   const { error, value } = schema.validate(req.params);

  //   let result: Either<ErrorResponse, ConversationResultDto>;

  //   if (error) {
  //     res.status(400).json({ errors: { message: error.details[0].message } });
  //   } else {
  //     result = await this.getConversationUsecase.execute({
  //       userName: userName,
  //       page: value.page,
  //     });
  //     if (isRight(result)) {
  //       const data = unwrapEither(result);
  //       res.status(200).send({ data: data });
  //       return;
  //     }

  //     const error = unwrapEither(result);
  //     res.status(error.statusCode).send({ errors: error });
  //     return;
  //   }
  // }

  // async getConversations(req: Request, res: Response) {
  //   const schema = Joi.object({
  //     conversationsId: objectId.objectId().required(),
  //     page: Joi.number().required(),
  //   });

  //   const { error, value } = schema.validate(req.params);

  //   let result: Either<ErrorResponse, ConversationsResultDto>;

  //   if (error) {
  //     res.status(400).json({ errors: { message: error.details[0].message } });
  //   } else {
  //     result = await this.getConversationsUsecase.execute({
  //       conversationsId: value.conversationsId,
  //       page: value.page,
  //     });

  //     if (isRight(result)) {
  //       const data = unwrapEither(result);
  //       res.status(200).send({ data: data });
  //       return;
  //     }

  //     const error = unwrapEither(result);
  //     res.status(error.statusCode).send({ errors: error });
  //     return;
  //   }
  // }
}
