import { Pages, StateStatus } from "@/app/core/types";
import { createAsyncThunk, createSlice, PayloadAction } from "@reduxjs/toolkit";

interface SegmentState {
  segment: string;
  stateStatus: StateStatus;
}

const initialState: SegmentState = {
  segment: Pages.LOGIN,
  stateStatus: StateStatus.INITIAL,
};

export const setSegment = createAsyncThunk(
  "segment/setSegment",
  async (segment: string) => {
    return segment;
  }
);

const segmentSlice = createSlice({
  name: "segment",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(setSegment.pending, (state) => {
        state.stateStatus = StateStatus.LOADING;
      })
      .addCase(setSegment.fulfilled, (state, action: PayloadAction<string>) => {
        state.segment = action.payload;
        state.stateStatus = StateStatus.LOADED;
      })
      .addCase(setSegment.rejected, (state) => {
        state.stateStatus = StateStatus.ERROR;
        state.stateStatus = StateStatus.LOADED;
      });
  },
});

export default segmentSlice.reducer;
