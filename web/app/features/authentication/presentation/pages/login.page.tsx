import Image from 'next/image';
import qclogo from '@/app/assets/images/qc_logo.png';
import { useAppSelector } from "@/app/core/hooks";
import { useEffect, useState } from "react";
import { LoginUserDto } from "../../data/dto/LoginUser.dto";
import { Pages, StateStatus } from "@/app/core/types";
import { LoginUserUsecase } from "../../domain/usecases/login_user.usecase";
import { SetSegmentUsecase } from "../../domain/usecases/set_segment.usecase";
import { useDispatch } from 'react-redux';
import AnimatedAlert from '@/app/core/animatedToast';

interface LoginPageProps {}

export const LoginPage: React.FC<LoginPageProps> = () => {
  const dispatch = useDispatch();

  // use cases
  const loginUserUsecase = new LoginUserUsecase();
  const setSegmentUsecase = new SetSegmentUsecase();

  // selectors
  const auth = useAppSelector((state) => state.auth);
  const { 
    stateStatus,
    errorMessage
  } = auth;

  // listeners
  useEffect(() => {
    console.log(`stat ${stateStatus}`)
    if(stateStatus === StateStatus.ERROR){
      toggleAlert();
    }
  }, [stateStatus]);

  // local states
  const [username, setUsername] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [errors, setErrors] = useState<{ username?: string; password?: string }>({});
  const [showAlert, setShowAlert] = useState(false);

  const validateFields = () => {
    const newErrors: { username?: string; password?: string } = {};
    if (!username.trim()) {
      newErrors.username = 'Username is required';
    }
    if (!password.trim()) {
      newErrors.password = 'Password is required';
    }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  // private methods
  const toggleAlert = () => {
    console.log('toggle')
    setShowAlert(!showAlert);
  };

  const handleLogin = () => {
    if (!validateFields()) {
      return;
    }

    const loginDto: LoginUserDto = {
      userName: username,
      password: password,
    };
    loginUserUsecase.execute(loginDto, dispatch);
  };

  return (
    <div>
      <AnimatedAlert
        showAlert={showAlert}
        message={errorMessage ?? ''}
        onClose={() => setShowAlert(false)}
      />
      <section className="bg-gray-50 dark:bg-gray-900">
        <div className="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
          <a className="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
            <Image src={qclogo} className="w-full h-8 mr-2" alt="My Image" width={400} height={300} />
          </a>
          <div className="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
              <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                Sign in to your account
              </h1>
              <form
                className="space-y-4 md:space-y-6"
                onSubmit={(e) => {
                  e.preventDefault();
                  handleLogin();
                }}
              >
                <div>
                  <label htmlFor="username" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                    Your username
                  </label>
                  <input
                    name="username"
                    id="username"
                    className={`bg-gray-50 border ${
                      errors.username ? 'border-red-500' : 'border-gray-300'
                    } text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`}
                    placeholder="username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                  />
                  {errors.username && <p className="mt-1 text-sm text-red-500">{errors.username}</p>}
                </div>
                <div>
                  <label htmlFor="password" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                    Password
                  </label>
                  <input
                    type="password"
                    name="password"
                    id="password"
                    placeholder="••••••••"
                    className={`bg-gray-50 border ${
                      errors.password ? 'border-red-500' : 'border-gray-300'
                    } text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                  />
                  {errors.password && <p className="mt-1 text-sm text-red-500">{errors.password}</p>}
                </div>
                <button
                  type="submit"
                  className="w-full text-white bg-red-400 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                  // disabled={!username || !password}
                >
                  Sign in
                </button>
                <p className="text-sm font-light text-gray-500 dark:text-gray-400">
                  Don't have an account yet?{' '}
                  <button
                    className="font-medium text-primary-600 hover:underline dark:text-primary-500"
                    onClick={(e) => {
                      e.preventDefault();
                      setSegmentUsecase.execute({ segment: Pages.REGISTER });
                    }}
                  >
                    Sign up
                  </button>
                </p>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default LoginPage;
