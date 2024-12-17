import { RegisterUserDto } from "../../data/dto/RegisterUser.dto";
import { registerUser } from "../../data/redux/authSlice";

export class RegisterUserUsecase {
  async execute(
    {
      registerUserDto,
    }: {
      registerUserDto: RegisterUserDto;
    },
    dispatch: any
  ): Promise<void> {
    dispatch(registerUser(registerUserDto));
  }
}
