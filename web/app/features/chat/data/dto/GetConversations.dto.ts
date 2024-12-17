export class GetConversationsDto {
  constructor(
    public userName: string,
    public conversationsId: string,
    public page: number
  ) {}
}
