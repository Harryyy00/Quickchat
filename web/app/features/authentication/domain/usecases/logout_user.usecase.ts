import { logoutUser } from "../../data/redux/authSlice";

export class LogoutUserUsecase {
  async execute(dispatch: any): Promise<void> {
    dispatch(logoutUser());
  }
}
