import { Result } from "@/app/core/result";
import { LoginUserDto } from "../../data/dto/LoginUser.dto";
import { LoginDatasDto } from "../../data/dto/LoginData.dto";
import { RegisterUserDto } from "../../data/dto/RegisterUser.dto";

export interface AuthRepository {
  loginUser(loginUserDto: LoginUserDto): Promise<Result<LoginDatasDto>>;
  autoLogin(): Promise<Result<LoginDatasDto>>;
  registerUser(registerUserDto: RegisterUserDto): Promise<Result<void>>;
  logoutUser(): Promise<Result<void>>;
}
