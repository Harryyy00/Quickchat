import { Result } from "@/app/core/result";
import { LoginUserDto } from "../../data/dto/LoginUser.dto";
import { LoginDataDto } from "../../data/dto/LoginData.dto";

export interface AuthRepository {
  loginUser(loginUserDto: LoginUserDto): Promise<Result<LoginDataDto>>;
  logoutUser(): Promise<void>;
}
