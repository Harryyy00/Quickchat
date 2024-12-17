import { createSlice, createAsyncThunk, PayloadAction } from "@reduxjs/toolkit";
import { LoginUserDto } from "../dto/LoginUser.dto";
import { LoginDatasDto } from "../dto/LoginData.dto";

import { AuthRepositoryImpl } from "../repositories/auth_repository_impl";
import { AuthRemoteDatasource } from "../datasources/auth_remote_datasource";
import { AuthStatus, NavigatePage, StateStatus } from "@/app/core/types";
import { AuthLocalDataSource } from "../datasources/auth_local_datasource";
import { RegisterUserDto } from "../dto/RegisterUser.dto";

const authRemoteDatasource = new AuthRemoteDatasource();
const authLocalDatasource = new AuthLocalDataSource();

// repository instance
const authRepository = new AuthRepositoryImpl(
  authRemoteDatasource,
  authLocalDatasource
);

interface AuthState {
  loginDatas: LoginDatasDto | null;
  errorMessage: string | null;
  stateStatus: StateStatus;
  navigatePage: NavigatePage;
  authStatus: AuthStatus;
  hasRegisteredUser: boolean;
}

const initialState: AuthState = {
  loginDatas: null,
  errorMessage: null,
  stateStatus: StateStatus.INITIAL,
  navigatePage: NavigatePage.LOGIN,
  authStatus: AuthStatus.UNAUTHENTICATED,
  hasRegisteredUser: false,
};

export const loginUser = createAsyncThunk(
  "auth/loginUser",
  async (loginUserDto: LoginUserDto, { dispatch }) => {
    const result = await authRepository.loginUser(loginUserDto);
    if (!result.isSuccess) {
      setTimeout(() => {
        dispatch(authSlice.actions.resetStateStatus());
      }, 1000);
      throw new Error(result.getError);
    }

    return result.getValue;
  }
);

export const autoLogin = createAsyncThunk("auth/autoLogin", async () => {
  const result = await authRepository.autoLogin();
  if (!result.isSuccess) {
    throw new Error(result.getError);
  }
  return result.getValue;
});

export const registerUser = createAsyncThunk(
  "auth/registerUser",
  async (registerUserDto: RegisterUserDto, { dispatch }) => {
    const result = await authRepository.registerUser(registerUserDto);
    if (!result.isSuccess) {
      setTimeout(() => {
        dispatch(authSlice.actions.resetStateStatus());
      }, 1000);
      throw new Error(result.getError);
    }

    // note: called last
    // dispatch an action to reset `hasRegisteredUser` after registration
    setTimeout(() => {
      dispatch(authSlice.actions.resetHasRegisteredUser());
    }, 1000); // set delay time

    return result.getValue;
  }
);

export const logoutUser = createAsyncThunk("auth/logoutUser", async () => {
  const result = await authRepository.logoutUser();
  if (!result.isSuccess) {
    throw new Error(result.getError);
  }
  return result.getValue;
});

// Slice
const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    resetHasRegisteredUser(state) {
      state.hasRegisteredUser = false;
    },
    resetStateStatus(state) {
      state.stateStatus = StateStatus.LOADED;
    },
  },
  extraReducers: (builder) => {
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
      });

    // auto login
    builder
      .addCase(autoLogin.pending, (state) => {
        state.stateStatus = StateStatus.LOADING;
      })
      .addCase(
        autoLogin.fulfilled,
        (state, action: PayloadAction<LoginDatasDto>) => {
          state.stateStatus = StateStatus.LOADED;
          state.authStatus = AuthStatus.AUTHENTICATED;
          state.loginDatas = action.payload;
          state.navigatePage = NavigatePage.HOME;
        }
      )
      .addCase(autoLogin.rejected, (state, action) => {
        state.stateStatus = StateStatus.ERROR;
        state.errorMessage = action.error.message ?? "Login failed";
      });

    builder
      .addCase(registerUser.pending, (state) => {
        state.stateStatus = StateStatus.LOADING;
      })
      .addCase(registerUser.fulfilled, (state) => {
        state.hasRegisteredUser = true;
        state.stateStatus = StateStatus.LOADED;
      })
      .addCase(registerUser.rejected, (state, action) => {
        state.errorMessage = action.error.message ?? "Error registering user";
        state.stateStatus = StateStatus.ERROR;
      });

    // logout
    builder
      .addCase(logoutUser.pending, (state) => {
        state.stateStatus = StateStatus.LOADING;
      })
      .addCase(logoutUser.fulfilled, (state) => {
        state.loginDatas = null;
        state.authStatus = AuthStatus.UNAUTHENTICATED;
        state.stateStatus = StateStatus.LOADED;
      })
      .addCase(logoutUser.rejected, (state, action) => {
        state.stateStatus = StateStatus.ERROR;
        state.errorMessage = action.error.message ?? "Failed to logout";
      });
  },
});

export default authSlice.reducer;
