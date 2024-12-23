import { ObjectId } from "mongodb";
import { MessageDto } from "./Message.dto";

export class Conversation {
  constructor(
    public sender: string,
    public recipient: string,
    public conversationsId: ObjectId,
    public timeStamp: Date,
    public lastMessage: string // public conversationList: MessageDto[]
  ) {}
}
