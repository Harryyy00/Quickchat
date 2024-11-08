import Image from 'next/image';
import qclogo from '@/app/assets/images/qc_logo.png';
import { useAppSelector } from "@/app/core/hooks";
import { useState } from "react";
import { LoginUserDto } from "../../data/dto/LoginUser.dto";
import { Pages, StateStatus } from "@/app/core/types";
import { LoginUserUsecase } from "../../domain/usecases/login_user.usecase";
import { SetSegmentUsecase } from "../../domain/usecases/set_segment.usecase";

interface LoginPageProps {}

export const LoginPage: React.FC<LoginPageProps> = () => {
  const loginUserUsecase = new LoginUserUsecase();
  const setSegmentUsecase = new SetSegmentUsecase();

  const { stateStatus, errorMessage, loginDatas } = useAppSelector((state) => state.auth);
  const [username, setUsername] = useState<string>('');
  const [password, setPassword] = useState<string>('');

  const handleLogin = () => {
    const loginDto: LoginUserDto = {
      userName: username,
      password: password,
    };
    loginUserUsecase.execute(loginDto);
  };


  return (
    
    <div>
      <section className="bg-gray-50 dark:bg-gray-900">
        <div className="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
          <a href="#" className="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
            <Image src={qclogo} className="w-full h-8 mr-2" alt="My Image" width={400} height={300} />
          </a>
          <div className="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
              <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                Sign in to your account
              </h1>
              <form className="space-y-4 md:space-y-6" onSubmit={(e) => { e.preventDefault(); handleLogin(); }}>
                <div>
                  <label htmlFor="username" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                    Your username
                  </label>
                  <input
                    name="username"
                    id="username"
                    className="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    placeholder="username"
                    required
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                  />
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
                    className="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                  />
                </div>
                <button
                  type="submit"
                  className="w-full text-black bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                  disabled={stateStatus === StateStatus.LOADING} 
                >
                  Sign in
                </button>
                <p className="text-sm font-light text-gray-500 dark:text-gray-400">
                  Don't have an account yet? {''}
                  {/* <Link href="signup" className="font-medium text-primary-600 hover:underline dark:text-primary-500"/>*/}
                  <button
                  className="font-medium text-primary-600 hover:underline dark:text-primary-500"
                  onClick={(e) => { e.preventDefault(); setSegmentUsecase.execute({segment: Pages.REGISTER}); }}
                  >
                    Sign up
                  </button>
                  {/* <a href="signup"
                  className="font-medium text-primary-600 hover:underline dark:text-primary-500"
                  >
                    Sign up
                  </a> */}
                </p>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );

  return (
    <div>
      <h2>Login</h2>
      <input
        type="text"
        placeholder="Username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />
      <input
        type="password"
        placeholder="Password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />
      <button onClick={handleLogin} disabled={stateStatus === StateStatus.LOADING}>Login</button>
      {stateStatus === StateStatus.LOADING && <p>Loading...</p>}
      {stateStatus === StateStatus.ERROR && <p>Error: {errorMessage}</p>}
      {loginDatas?.token && <p>Login successful! Token: {loginDatas?.token}</p>}
    </div>
  );
};

export default LoginPage;