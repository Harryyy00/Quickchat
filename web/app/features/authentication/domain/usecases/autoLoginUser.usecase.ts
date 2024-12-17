import { autoLogin } from "../../data/redux/authSlice";

export class AutoLoginUserUsecase {
  async execute(dispatch: any): Promise<void> {
    dispatch(autoLogin());
  }
}
