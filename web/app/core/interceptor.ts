import axios, {
  AxiosError,
  AxiosInstance,
  AxiosResponse,
  InternalAxiosRequestConfig,
} from "axios";
import { LogoutUserUsecase } from "../features/authentication/domain/usecases/logout_user.usecase";
import { useDispatch } from "react-redux";
import { DisposeChatStreamUsecase } from "../features/chat/domain/usecases/disposeChatStream.usecase";

interface StorageInterface {
  getItem(key: string): string | null;
  setItem(key: string, value: string): void;
}

export class AuthenticationInterceptor {
  private isReAuthenticated: boolean = false;
  private storage: StorageInterface;
  private axiosInstance: AxiosInstance;

  constructor(storage: StorageInterface) {
    this.storage = storage;
    this.axiosInstance = axios.create();
    this.setupInterceptors();
  }

  private setupInterceptors(): void {
    // Request interceptor
    this.axiosInstance.interceptors.request.use(
      (config: InternalAxiosRequestConfig) => {
        const token = this.getAccessToken();

        config.headers["Content-Type"] = "application/json";
        if (token) {
          config.headers["Authorization"] = `Bearer ${token}`;
        }

        this.isReAuthenticated = false;
        return config;
      },
      (error: AxiosError) => {
        return Promise.reject(error);
      }
    );

    // Response/Error interceptor
    this.axiosInstance.interceptors.response.use(
      (response: AxiosResponse) => response,
      async (error: AxiosError) => {
        const errorResponse = error.response?.data as any;

        // JWT expired error
        if (errorResponse?.message?.message === "jwt expired") {
          // Assuming you have a logout function similar to the Dart version
          await this.logoutUser();
        }

        // device token error
        if (
          errorResponse?.errors?.[0]?.detail === "Device token already exists"
        ) {
          return Promise.resolve({
            ...error.response,
            config: error.config,
          });
        }

        // return Promise.reject(error);
        return Promise.reject(errorResponse.errors.errorMessage);
      }
    );
  }

  private getAccessToken(): string {
    return this.storage.getItem("access_token") || "";
  }

  private logoutUser(): Promise<void> {
    new LogoutUserUsecase().execute(useDispatch());
    new DisposeChatStreamUsecase().execute(useDispatch());
    return Promise.resolve();
  }

  // function to print long text in chunks
  private printWrapped(text: string): void {
    const pattern = /.{1,800}/g;
    const matches = text.match(pattern);
    matches?.forEach((chunk) => console.log(chunk));
  }

  // to get the axios instance with interceptors
  public getAxiosInstance(): AxiosInstance {
    return this.axiosInstance;
  }
}

// access local storage
const storage = {
  getItem: (key: string): string | null => localStorage.getItem(key),
  setItem: (key: string, value: string): void =>
    localStorage.setItem(key, value),
};

const authInterceptor = new AuthenticationInterceptor(storage);
const axiosInstance = authInterceptor.getAxiosInstance();

// configured axios instance for API calls
export default axiosInstance;
