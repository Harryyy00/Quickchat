import { createAsyncThunk, createSlice, PayloadAction } from "@reduxjs/toolkit";
import { SearchDataDto } from "../dto/SearchData.dto";
import { StateStatus } from "@/app/core/types";
import { UserDataDto } from "@/app/features/authentication/data/dto/UserData.dto";
import { UserRemoteDatasource } from "../datasources/user_remote_datasource";
import { UserRepositoryImpl } from "../repositories/user_repository_impl";
import { SearchUserDto } from "../dto/SearchUser.dto";

// datasources
const userRemoteDatasource = new UserRemoteDatasource();

// repositories
const userRepository = new UserRepositoryImpl(userRemoteDatasource);

// slices
interface UserState {
  errorMessage: string | null;
  stateStatus: StateStatus;
  search: SearchDataDto | null;
  searchList: UserDataDto[];
}

// initial state
const initialState: UserState = {
  errorMessage: null,
  stateStatus: StateStatus.INITIAL,
  search: null,
  searchList: [],
};

export const search = createAsyncThunk(
  "user/searchUser",
  async (params: { searchUserDto: SearchUserDto }) => {
    const result = await userRepository.search(params.searchUserDto);
    if (!result.isSuccess) {
      throw new Error(result.getError);
    }
    return result.getValue;
  }
);

const userSlice = createSlice({
  name: "user",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(search.pending, (state, action) => {
        state.stateStatus = action.meta.arg.searchUserDto.stateStatus;
      })
      .addCase(search.fulfilled, (state, action) => {
        const page = action.meta.arg.searchUserDto.page;
        const resultList = action.payload.users;
        const search = action.payload;
        const updatedList = getUpdatedList(state.searchList, resultList, page);

        state.search = search;
        state.searchList = updatedList;
        state.stateStatus = StateStatus.LOADED;
      })

      .addCase(search.rejected, (state, action) => {
        state.stateStatus = StateStatus.ERROR;
        state.errorMessage = action.error.message ?? "Failed to search user";
      });
  },
});

function getUpdatedList<T>(
  currentList: T[],
  resultList: T[],
  page: number
): T[] {
  const updatedList: T[] = [];

  for (const value of resultList) {
    if (!updatedList.some((item) => item === value)) {
      updatedList.push(value);
    } else {
      const index = updatedList.findIndex((item) => item === value);
      if (index !== 0) {
        updatedList.splice(index, 1, value);
      }
    }
  }

  if (page !== 1) {
    for (const value of currentList) {
      if (!updatedList.some((item) => item === value)) {
        updatedList.push(value);
      }
    }
  }

  return updatedList;
}

export default userSlice.reducer;
