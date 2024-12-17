import { LoginUserDto } from "../../data/dto/LoginUser.dto";
import { loginUser } from "../../data/redux/authSlice";

export class LoginUserUsecase {
  async execute(
    {
      userName,
      password,
    }: {
      userName: string;
      password: string;
    },
    dispatch: any
  ): Promise<void> {
    const loginUserDto = new LoginUserDto(userName, password);
    dispatch(loginUser(loginUserDto));
  }
}
