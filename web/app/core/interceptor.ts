import axios, {
  AxiosError,
  AxiosInstance,
  AxiosRequestConfig,
  AxiosResponse,
  InternalAxiosRequestConfig,
} from "axios";

interface StorageInterface {
  getItem(key: string): string | null;
  setItem(key: string, value: string): void; // Fixed: Added value parameter
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

        // Handle JWT expired error
        if (errorResponse?.message?.message === "jwt expired") {
          // Assuming you have a logout function similar to the Dart version
          await this.logoutUser();
        }

        // Handle device token error
        if (
          errorResponse?.errors?.[0]?.detail === "Device token already exists"
        ) {
          return Promise.resolve({
            ...error.response,
            config: error.config,
          });
        }

        return Promise.reject(error);
      }
    );
  }

  private getAccessToken(): string {
    return this.storage.getItem("ACCESS_TOKEN") || "";
  }

  private logoutUser(): Promise<void> {
    // Implement your logout logic here
    return Promise.resolve();
  }

  // Utility function to print long text in chunks
  private printWrapped(text: string): void {
    const pattern = /.{1,800}/g;
    const matches = text.match(pattern);
    matches?.forEach((chunk) => console.log(chunk));
  }

  // Method to get the axios instance with interceptors
  public getAxiosInstance(): AxiosInstance {
    return this.axiosInstance;
  }
}

// Usage example
const storage = {
  getItem: (key: string): string | null => localStorage.getItem(key),
  setItem: (key: string, value: string): void =>
    localStorage.setItem(key, value),
};

const authInterceptor = new AuthenticationInterceptor(storage);
const axiosInstance = authInterceptor.getAxiosInstance();

// Use the configured axios instance for your API calls
export default axiosInstance;
