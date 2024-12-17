export class ConversationDto {
  constructor(
    public sender: string,
    public recipient: string,
    public lastMessage: string,
    public timeStamp: string,
    public conversationsId: string
  ) {}
}
