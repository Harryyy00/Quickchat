import { LoginDatasDto } from "../dto/LoginData.dto";
import { UserDataDto } from "../dto/UserData.dto";

export interface AuthLocalDataSource {
  saveToken(token: string): void;
  saveUserData(userData: UserDataDto): void;
  getUserData(): UserDataDto;
  getToken(): string | null;
  deleteUserDataAndToken(): void;
}

export class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  private static readonly USER_ID_KEY = "user_id";
  private static readonly USERFULLNAME_KEY = "user_full_name";
  private static readonly USERNAME_KEY = "username";
  private static readonly ACCESS_TOKEN_KEY = "access_token";

  saveToken(token: string): void {
    try {
      localStorage.setItem(AuthLocalDataSourceImpl.ACCESS_TOKEN_KEY, token);
    } catch (e) {
      console.error("Failed to save token:", e);
      throw new Error("Error saving token.");
    }
  }

  saveUserData(userData: UserDataDto): void {
    try {
      localStorage.setItem(AuthLocalDataSourceImpl.USER_ID_KEY, userData.id);
      localStorage.setItem(
        AuthLocalDataSourceImpl.USERFULLNAME_KEY,
        userData.userName
      );
      localStorage.setItem(AuthLocalDataSourceImpl.USERNAME_KEY, userData.name);
    } catch (e) {
      console.error("Failed to save user data:", e);
      throw new Error("Error saving user data.");
    }
  }

  getUserData(): UserDataDto {
    try {
      const id = localStorage.getItem(AuthLocalDataSourceImpl.USER_ID_KEY);
      const name = localStorage.getItem(
        AuthLocalDataSourceImpl.USERFULLNAME_KEY
      );
      const userName = localStorage.getItem(
        AuthLocalDataSourceImpl.USERNAME_KEY
      );

      return this.parseUserData(id, name, userName);
    } catch (e) {
      console.error("Failed to retrieve user data:", e);
      throw new Error("Error retrieving user data.");
    }
  }

  getToken(): string | null {
    try {
      return localStorage.getItem(AuthLocalDataSourceImpl.ACCESS_TOKEN_KEY);
    } catch (e) {
      console.error("Failed to retrieve token:", e);
      throw new Error("Error retrieving token.");
    }
  }

  deleteUserDataAndToken(): void {
    try {
      localStorage.removeItem(AuthLocalDataSourceImpl.USER_ID_KEY);
      localStorage.removeItem(AuthLocalDataSourceImpl.USERNAME_KEY);
      localStorage.removeItem(AuthLocalDataSourceImpl.ACCESS_TOKEN_KEY);
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
