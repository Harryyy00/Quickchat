export class RegisterUserDto {
  constructor(
    public name: string,
    public userName: string,
    public password: string,
    public profilePicture?: Buffer,
    public profilePictureUrl?: string,
    public profilePictureBlob?: string
  ) {}
}
