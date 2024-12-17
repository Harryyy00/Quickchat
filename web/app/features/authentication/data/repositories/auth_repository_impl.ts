import { AuthRepository } from "../../domain/repositories/auth_repository";
import { LoginUserDto } from "../dto/LoginUser.dto";
import { LoginDatasDto } from "../dto/LoginData.dto";
import { AuthRemoteDatasource } from "../datasources/auth_remote_datasource";
import { Result } from "@/app/core/result";
import { AuthLocalDataSource } from "../datasources/auth_local_datasource";
import { RegisterUserDto } from "../dto/RegisterUser.dto";

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
      this.authLocalDataSource.saveCredentials(
        loginUserDto.userName,
        loginUserDto.password
      );
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async autoLogin(): Promise<Result<LoginDatasDto>> {
    try {
      const credentials = this.authLocalDataSource.getCredentials();
      const loginData = new LoginUserDto(
        credentials.userName,
        credentials.password
      );
      const response = await this.authRemoteDatasource.loginUser(loginData);
      this.authLocalDataSource.saveToken(response.token);
      this.authLocalDataSource.saveUserData(response.user);
      this.authLocalDataSource.saveCredentials(
        credentials.userName,
        credentials.password
      );
      return Result.success(response);
    } catch (error) {
      return Result.failure(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async registerUser(registerUserDto: RegisterUserDto): Promise<Result<void>> {
    try {
      await this.authRemoteDatasource.registerUser(registerUserDto);
      this.authLocalDataSource.saveCredentials(
        registerUserDto.userName,
        registerUserDto.password
      );
      return Result.success<void>(undefined);
    } catch (error) {
      return Result.failure<void>(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }

  async logoutUser(): Promise<Result<void>> {
    try {
      this.authLocalDataSource.deleteCredentials();
      return Result.success<void>(undefined);
    } catch (error) {
      return Result.failure<void>(
        error instanceof Error ? error.message : "Unknown error"
      );
    }
  }
}
