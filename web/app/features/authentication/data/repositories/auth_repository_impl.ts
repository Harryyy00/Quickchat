import { AuthRepository } from "../../domain/repositories/auth_repository";
import { LoginUserDto } from "../dto/LoginUser.dto";
import { LoginDatasDto } from "../dto/LoginData.dto";
import { AuthRemoteDatasource } from "../datasources/auth_remote_datasource";
import { Result } from "@/app/core/result";
import { AuthLocalDataSource } from "../datasources/auth_local_datasource";

export class AuthRepositoryImpl implements AuthRepository {
  constructor(
    private readonly authRemoteDatasource: AuthRemoteDatasource,
    private readonly authLocalDataSource: AuthLocalDataSource
  ) {}

  async loginUser(loginUserDto: LoginUserDto): Promise<Result<LoginDatasDto>> {
    try {
      const response = await this.authRemoteDatasource.loginUser(loginUserDto);
      this.authLocalDataSource.saveToken(response.token);
      this.authLocalDataSource.saveUserData(response.user);
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async logoutUser(): Promise<void> {
    return this.authRemoteDatasource.logoutUser();
  }
}
