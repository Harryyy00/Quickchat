import { useAppDispatch } from "@/app/core/hooks";

import { LoginUserDto } from "../../data/dto/LoginUser.dto";
import { loginUser } from "../../data/redux/authSlice";

export class LoginUserUsecase {
  dispatch = useAppDispatch();
  async execute({
    userName,
    password,
  }: {
    userName: string;
    password: string;
  }): Promise<void> {
    const loginUserDto = new LoginUserDto(userName, password);
    this.dispatch(loginUser(loginUserDto));
  }
}
