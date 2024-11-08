import axios, { AxiosError } from "axios";
import { LoginUserDto } from "../dto/LoginUser.dto";
import { LoginDatasDto } from "../dto/LoginData.dto";
import { config } from "../../../../core/config";
import axiosInstance from "@/app/core/interceptor";

export class AuthRemoteDatasource {
  async loginUser(loginUserDto: LoginUserDto): Promise<LoginDatasDto> {
    try {
      const rawData = {
        userName: loginUserDto.userName,
        password: loginUserDto.password,
      };

      const response = await axiosInstance.post<{ data: any }>(
        `${config.quickChatService}/login`,
        rawData // axios will automatically stringify the body
      );

      if (response.status === 200 && response.data?.data) {
        return this.parseLoginData(response.data.data);
      }

      throw new Error("Invalid response format");
    } catch (error) {
      console.log(`EEERRRR: ${error}`);
      throw this.checkErrResponse(error);
    }
  }

  async logoutUser(): Promise<void> {
    try {
      await axiosInstance.post(`${config.quickChatService}/logout`);
    } catch (error) {
      throw this.checkErrResponse(error);
    }
  }

  // Private Methods
  //
  private checkErrResponse(error: any): Error {
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError<any>;
      const response = axiosError.response;

      if (!response) {
        return new Error("No response received");
      }

      // Handle specific error cases
      if (response.data?.message?.message === "jwt expired") {
        return new Error("Session expired");
      }

      // Return the error message from the response if available
      const errorMessage =
        response.data?.message?.message ||
        response.data?.message ||
        response.data?.error ||
        "Unknown error occurred";

      return new Error(errorMessage);
    }

    return new Error("An unexpected error occurred");
  }

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
