import Cookies from "js-cookie";
import { UserDataDto } from "../dto/UserData.dto";
import { GetCredentialsDto } from "../dto/GetCredentials.dto";

export class AuthLocalDataSource {
  private static readonly USER_ID_KEY = "user_id";
  private static readonly USERFULLNAME_KEY = "user_full_name";
  private static readonly USERNAME_KEY = "username";
  private static readonly ACCESS_TOKEN_KEY = "access_token";

  saveToken(token: string): void {
    try {
      localStorage.setItem(AuthLocalDataSource.ACCESS_TOKEN_KEY, token);
    } catch (e) {
      console.error("Failed to save token:", e);
      throw new Error("Error saving token.");
    }
  }

  saveUserData(userData: UserDataDto): void {
    try {
      localStorage.setItem(AuthLocalDataSource.USER_ID_KEY, userData.id);
      localStorage.setItem(AuthLocalDataSource.USERFULLNAME_KEY, userData.name);
      localStorage.setItem(AuthLocalDataSource.USERNAME_KEY, userData.userName);
    } catch (e) {
      console.error("Failed to save user data:", e);
      throw new Error("Error saving user data.");
    }
  }

  deleteCredentials(): void {
    try {
      localStorage.removeItem(AuthLocalDataSource.USER_ID_KEY);
      localStorage.removeItem(AuthLocalDataSource.USERFULLNAME_KEY);
      localStorage.removeItem(AuthLocalDataSource.USERNAME_KEY);
      localStorage.removeItem(AuthLocalDataSource.ACCESS_TOKEN_KEY);

      Cookies.remove("userName", { secure: true });
      Cookies.remove("password", { secure: true });
    } catch (e) {
      console.error("Failed to delete user data:", e);
      throw new Error("Error dleting user data.");
    }
  }

  saveCredentials(userName: string, password: string): void {
    try {
      Cookies.set("userName", userName, { secure: true });
      Cookies.set("password", password, { secure: true });
    } catch (e) {
      throw new Error("Error saving credentials.");
    }
  }

  getCredentials(): GetCredentialsDto {
    try {
      const userName = Cookies.get("userName") ?? "";
      const password = Cookies.get("password") ?? "";

      return new GetCredentialsDto(userName, password);
    } catch (e) {
      throw new Error("Error saving credentials.");
    }
  }

  getUserData(): UserDataDto {
    try {
      const id = localStorage.getItem(AuthLocalDataSource.USER_ID_KEY);
      const name = localStorage.getItem(AuthLocalDataSource.USERFULLNAME_KEY);
      const userName = localStorage.getItem(AuthLocalDataSource.USERNAME_KEY);

      return this.parseUserData(id, name, userName);
    } catch (e) {
      console.error("Failed to retrieve user data:", e);
      throw new Error("Error retrieving user data.");
    }
  }

  getToken(): string | null {
    try {
      return localStorage.getItem(AuthLocalDataSource.ACCESS_TOKEN_KEY);
    } catch (e) {
      console.error("Failed to retrieve token:", e);
      throw new Error("Error retrieving token.");
    }
  }

  deleteUserDataAndToken(): void {
    try {
      localStorage.removeItem(AuthLocalDataSource.USER_ID_KEY);
      localStorage.removeItem(AuthLocalDataSource.USERNAME_KEY);
      localStorage.removeItem(AuthLocalDataSource.ACCESS_TOKEN_KEY);
    } catch (e) {
      console.error("Failed to delete user data and token:", e);
      throw new Error("Error deleting user data and token.");
    }
  }

  private parseUserData(
    id: string | null,
    name: string | null,
    userName: string | null
  ): UserDataDto {
    if (!id || !name || !userName) {
      throw new Error("Invalid data response format");
    }
    return {
      id: id,
      name: name,
      userName: userName,
    };
  }
}
