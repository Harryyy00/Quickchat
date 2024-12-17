import axios, { AxiosError } from "axios";
import { LoginUserDto } from "../dto/LoginUser.dto";
import { LoginDatasDto } from "../dto/LoginData.dto";
import axiosInstance from "@/app/core/interceptor";
import { config } from "@/app/core/config";
import { RegisterUserDto } from "../dto/RegisterUser.dto";

export class AuthRemoteDatasource {
  async loginUser(loginUserDto: LoginUserDto): Promise<LoginDatasDto> {
    let response;
    try {
      const rawData = {
        userName: loginUserDto.userName,
        password: loginUserDto.password,
      };

      response = await axiosInstance.post<{ data: any }>(
        `${config.quickChatService}/login`,
        rawData // axios will automatically stringify the body
      );

      if (response.status === 200 && response.data?.data) {
        return this.parseLoginData(response.data.data);
      }

      throw new Error("Invalid response format");
    } catch (error) {
      throw new Error(`${error}`);
    }
  }

  async registerUser(registerUserDto: RegisterUserDto): Promise<void> {
    let response;
    try {
      const rawData = {
        name: registerUserDto.name,
        userName: registerUserDto.userName,
        password: registerUserDto.password,
        password_confirmation: registerUserDto.password,
      };

      response = await axiosInstance.post<{ data: any }>(
        `${config.quickChatService}/register`,
        rawData
      );

      if (response.status === 201) {
        return;
      }

      throw new Error("Invalid response format");
    } catch (error) {
      throw new Error(`${error}`);
    }
  }

  // Private Methods
  //

  private parseLoginData(data: any): LoginDatasDto {
    console.log(`dita: ${data}`);
    // Add type validation if needed
    if (!data.token || !data.user) {
      throw new Error("Invalid login response format");
    }

    return {
      accessToken: data.accessToken,
      userId: data.userId,
      username: data.username,
      email: data.email,
      // Add any other fields from your LoginDataDto
      ...data,
    };
  }
}
