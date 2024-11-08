import { configureStore } from "@reduxjs/toolkit";
import authReducer from "./features/authentication/data/redux/authSlice";
import segmentReducer from "./features/authentication/data/redux/segmentSlice";

export const store = configureStore({
  reducer: {
    auth: authReducer,
    segment: segmentReducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
