import { AuthStatus, Pages, StateStatus } from "../core/types";
import LoginPage from "../features/authentication/presentation/pages/login.page";
import { useAppSelector } from "@/app/core/hooks";
import { RegisterPage } from "../features/authentication/presentation/pages/register.page";
import { MainPage } from "./main";
import { isTokenValid } from "../core/decode";
interface HomePageProps {}

export const HomePage: React.FC<HomePageProps> = () =>  {
  const segment = useAppSelector((state) => state.segment);
  const auth = useAppSelector((state) => state.auth);

  const isValid = isTokenValid();

  if(auth.authStatus == AuthStatus.AUTHENTICATED
    && auth.stateStatus == StateStatus.LOADED || isValid){
      return <MainPage />;
    }

  
  if(segment.segment === Pages.REGISTER
    && segment.stateStatus === StateStatus.LOADED){
    return <RegisterPage />;
  }
  

  return <LoginPage />;
}
