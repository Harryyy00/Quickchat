export class ConversationsDto {
  constructor(
    public sender: string,
    public recipient: string,
    public sentAt: Date,
    public content: string
  ) {}
}
