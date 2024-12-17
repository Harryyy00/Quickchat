import { configureStore } from "@reduxjs/toolkit";
import authReducer from "./features/authentication/data/redux/authSlice";
import segmentReducer from "./features/authentication/data/redux/segmentSlice";
import chatReducer from "./features/chat/data/redux/chatSlice";
import userReducer from "./features/user/data/redux/userSlice";
export const store = configureStore({
  reducer: {
    auth: authReducer,
    segment: segmentReducer,
    chat: chatReducer,
    user: userReducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
