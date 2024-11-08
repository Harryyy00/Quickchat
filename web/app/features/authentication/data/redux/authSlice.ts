import { createSlice, createAsyncThunk, PayloadAction } from "@reduxjs/toolkit";
import { LoginUserDto } from "../dto/LoginUser.dto";
import { LoginDatasDto } from "../dto/LoginData.dto";

import { AuthRepositoryImpl } from "../repositories/auth_repository_impl";
import { AuthRemoteDatasource } from "../datasources/auth_remote_datasource";
import { AuthStatus, NavigatePage, StateStatus } from "@/app/core/types";
import { AuthLocalDataSourceImpl } from "../datasources/auth_local_datasource";

interface AuthState {
  loginDatas: LoginDatasDto | null;
  errorMessage: string | null;
  stateStatus: StateStatus;
  navigatePage: NavigatePage;
  authStatus: AuthStatus;
}

const initialState: AuthState = {
  loginDatas: null,
  errorMessage: null,
  stateStatus: StateStatus.INITIAL,
  navigatePage: NavigatePage.LOGIN,
  authStatus: AuthStatus.UNAUTHENTICATED,
};

const authRemoteDatasource = new AuthRemoteDatasource();
const authLocalDatasource = new AuthLocalDataSourceImpl();

// Create repository instance
const authRepository = new AuthRepositoryImpl(
  authRemoteDatasource,
  authLocalDatasource
);

// Async Actions (similar to Events in Bloc)
// export const connectServer = createAsyncThunk(
//   "auth/connectServer",
//   async () => {
//     // Implement connection logic if needed
//     return;
//   }
// );

export const loginUser = createAsyncThunk(
  "auth/loginUser",
  async (loginUserDto: LoginUserDto) => {
    const result = await authRepository.loginUser(loginUserDto);
    if (!result.isSuccess) {
      throw new Error(result.getError);
    }
    return result.getValue;
  }
);

// export const autoLoginUser = createAsyncThunk(An unexpected error occurred
//   "auth/autoLoginUser",
//   async () => {
//     const result = await authRepository.autoLoginUser();
//     if (!result.isSuccess) {
//       throw new Error(result.getError);
//     }
//     return result.getValue;
//   }
// );

// export const logoutUser = createAsyncThunk("auth/logoutUser", async () => {
//   const result = await authRepository.logoutUser();
//   if (!result.isSuccess) {
//     throw new Error(result.getError);
//   }
// });

// Slice
const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    load(state) {
      state.stateStatus = StateStatus.LOADED;
    },
  },
  extraReducers: (builder) => {
    // Connect Server
    // builder
    //   .addCase(connectServer.pending, (state) => {
    //     state.stateStatus = StateStatus.LOADING;
    //   })
    //   .addCase(connectServer.fulfilled, (state) => {
    //     state.stateStatus = StateStatus.LOADED;
    //     state.navigatePage = NavigatePage.LOGIN;
    //   });

    // Login User
    builder
      .addCase(loginUser.pending, (state) => {
        state.stateStatus = StateStatus.LOADING;
      })
      .addCase(
        loginUser.fulfilled,
        (state, action: PayloadAction<LoginDatasDto>) => {
          state.stateStatus = StateStatus.LOADED;
          state.authStatus = AuthStatus.AUTHENTICATED;
          state.loginDatas = action.payload;
          state.navigatePage = NavigatePage.HOME;
        }
      )
      .addCase(loginUser.rejected, (state, action) => {
        state.stateStatus = StateStatus.ERROR;
        state.errorMessage = action.error.message ?? "Login failed";
      })
      .addDefaultCase((state) => {
        state.stateStatus = StateStatus.LOADED;
      });

    // Auto Login
    // builder
    //   .addCase(autoLoginUser.pending, (state) => {
    //     state.stateStatus = StateStatus.LOADING;
    //   })
    //   .addCase(
    //     autoLoginUser.fulfilled,
    //     (state, action: PayloadAction<LoginDataDto>) => {
    //       state.stateStatus = StateStatus.LOADED;
    //       state.authStatus = AuthStatus.AUTHENTICATED;
    //       state.loginDatas = action.payload;
    //       state.navigatePage = NavigatePage.HOME;
    //     }
    //   )
    //   .addCase(autoLoginUser.rejected, (state, action) => {
    //     state.errorMessage = action.error.message ?? "Auto login failed";
    //     state.stateStatus = StateStatus.LOADED;
    //     state.authStatus = AuthStatus.UNAUTHENTICATED;
    //   });

    // Logout
    // builder
    //   .addCase(logoutUser.pending, (state) => {
    //     state.stateStatus = StateStatus.LOADING;
    //   })
    //   .addCase(logoutUser.fulfilled, (state) => {
    //     state.stateStatus = StateStatus.LOADED;
    //     state.authStatus = AuthStatus.UNAUTHENTICATED;
    //     state.loginDatas = null;
    //     state.navigatePage = NavigatePage.LOGIN;
    //   })
    //   .addCase(logoutUser.rejected, (state, action) => {
    //     state.errorMessage = action.error.message ?? "Logout failed";
    //     state.stateStatus = StateStatus.ERROR;
    //   });
  },
});

export default authSlice.reducer;
