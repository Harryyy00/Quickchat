import { UserDataDto } from "./UserData.dto";

export class LoginDatasDto {
  constructor(public token: string, public user: UserDataDto) {}
}
