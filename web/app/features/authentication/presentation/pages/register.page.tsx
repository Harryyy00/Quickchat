import Image from 'next/image';
import qclogo from '@/app/assets/images/qc_logo.png';
import React, { useEffect, useState } from "react";
import { Pages, StateStatus } from "@/app/core/types";
import { SetSegmentUsecase } from "../../domain/usecases/set_segment.usecase";
import { RegisterUserUsecase } from '../../domain/usecases/registerUser.usecase';
import { useDispatch } from 'react-redux';
import { RegisterUserDto } from '../../data/dto/RegisterUser.dto';
import { AutoLoginUserUsecase } from '../../domain/usecases/autoLoginUser.usecase';
import { useAppSelector } from '@/app/core/hooks';
import AnimatedAlert from '@/app/core/animatedToast';

interface RegisterPageProps {}

export const RegisterPage: React.FC<RegisterPageProps> = () => {
  const dispatch = useDispatch();

  const setSegmentUsecase = new SetSegmentUsecase();
  const registerUserUserUsecase = new RegisterUserUsecase();
  const autoLoginUserUsecase = new AutoLoginUserUsecase();
  
  // Selectors
  const auth = useAppSelector((state) => state.auth);
  const { 
    hasRegisteredUser,
    stateStatus,
    errorMessage
  } = auth;

  // listeners
  useEffect(() => {
    console.log(`asdad ${hasRegisteredUser}`)
    if(hasRegisteredUser){
      toggleModal();
      setFormData({
        name: "",
        username: "",
        password: "",
        confirmPassword: "",
      });
    }
     
  }, [hasRegisteredUser]);
  useEffect(() => {
    console.log(`stat ${stateStatus}`)
    if(stateStatus === StateStatus.ERROR){
      toggleAlert();
    }
  }, [stateStatus]);


  // local states
  const [formData, setFormData] = useState({
    name: "",
    username: "",
    password: "",
    confirmPassword: "",
  });
  const [errors, setErrors] = useState({
    name: "",
    username: "",
    password: "",
    confirmPassword: "",
  });

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [showAlert, setShowAlert] = useState(false);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const validateForm = () => {
    const newErrors: typeof errors = {
      name: "",
      username: "",
      password: "",
      confirmPassword: "",
    };

    if (!formData.name.trim()) newErrors.name = "Name is required.";
    if (!formData.username.trim()) newErrors.username = "Username is required.";
    if (!formData.password.trim()) newErrors.password = "Password is required.";
    if (formData.password !== formData.confirmPassword)
      newErrors.confirmPassword = "Passwords do not match.";

    setErrors(newErrors);
    return Object.values(newErrors).every((error) => error === "");
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (validateForm()) {
      console.log("Form submitted:", formData);
      const registerData = new RegisterUserDto(
        formData.name,
        formData.username,
        formData.password,
      )
      registerUserUserUsecase.execute({registerUserDto: registerData}, dispatch)
    }
  };

  const toggleModal = () => {
    console.log('toggle')
    setIsModalOpen(!isModalOpen);
  };
  const toggleAlert = () => {
    console.log('toggle')
    setShowAlert(!showAlert);
  };


  return (
    <div>
      <AnimatedAlert
        showAlert={showAlert}
        message={errorMessage ?? ''}
        onClose={() => setShowAlert(false)}
      />
      {isModalOpen && (
        <div className="mt-2">
          <div className="fixed inset-0 z-50 flex justify-center items-center overflow-x-hidden overflow-y-auto outline-none focus:outline-none">
            {/* Backdrop */}
            <div 
              onClick={toggleModal} 
              className="fixed inset-0 z-40 bg-black opacity-50"
            ></div>
            
            {/* Modal Content */}
            <div className="relative z-50 w-auto max-w-md mx-auto my-6">
              <div className="relative bg-white rounded-lg shadow-lg dark:bg-gray-700">
                <div className="p-6 text-center">
                  <h2 className="text-xl text-black font-semibold mb-4">Account Created</h2>
                  <p className="mb-6 text-black">Do you want to login?</p>
                  
                  <div className="flex justify-center space-x-4">
                    <button 
                      onClick={toggleModal}
                      className="px-4 py-2 bg-gray-200 text-gray-800 rounded-md hover:bg-gray-300 transition-colors"
                    >
                      No, keep me logged out
                    </button>
                    
                    <button 
                      onClick={(e) => {e.preventDefault, autoLoginUserUsecase.execute(dispatch)}}
                      className="px-4 py-2 bg-red-400 text-white rounded-md hover:bg-blue-600 transition-colors"
                    >
                      Yes, I want to login
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
      <section className="bg-gray-50 dark:bg-gray-900">
        <div className="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
          <a
            href="#"
            className="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white"
          >
            <Image src={qclogo} className="w-full h-8 mr-2" alt="My Image" width={400} height={300} />
          </a>
          <div className="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
              <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                Create an account
              </h1>
              <form className="space-y-4 md:space-y-6" onSubmit={handleSubmit}>
                {/* Name */}
                <div>
                  <label
                    htmlFor="name"
                    className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >
                    Name
                  </label>
                  <input
                    type="text"
                    name="name"
                    id="name"
                    className={`bg-gray-50 border ${
                      errors.password ? 'border-red-500' : 'border-gray-300'
                    } text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`}
                    placeholder="Name"
                    value={formData.name}
                    onChange={handleInputChange}
                  />
                  {errors.name && (
                    <p className="text-sm text-red-600">{errors.name}</p>
                  )}
                </div>

                {/* Username */}
                <div>
                  <label
                    htmlFor="username"
                    className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >
                    Username
                  </label>
                  <input
                    type="text"
                    name="username"
                    id="username"
                    className={`bg-gray-50 border ${
                      errors.password ? 'border-red-500' : 'border-gray-300'
                    } text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`}
                    placeholder="Username"
                    value={formData.username}
                    onChange={handleInputChange}
                  />
                  {errors.username && (
                    <p className="text-sm text-red-600">{errors.username}</p>
                  )}
                </div>

                {/* Password */}
                <div>
                  <label
                    htmlFor="password"
                    className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >
                    Password
                  </label>
                  <input
                    type="password"
                    name="password"
                    id="password"
                    className={`bg-gray-50 border ${
                      errors.password ? 'border-red-500' : 'border-gray-300'
                    } text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`}
                    placeholder="••••••••"
                    value={formData.password}
                    onChange={handleInputChange}
                  />
                  {errors.password && (
                    <p className="text-sm text-red-600">{errors.password}</p>
                  )}
                </div>

                {/* Confirm Password */}
                <div>
                  <label
                    htmlFor="confirmPassword"
                    className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                  >
                    Confirm password
                  </label>
                  <input
                    type="password"
                    name="confirmPassword"
                    id="confirmPassword"
                    className={`bg-gray-50 border ${
                      errors.confirmPassword ? 'border-red-500' : 'border-gray-300'
                    } text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500`}
                    placeholder="••••••••"
                    value={formData.confirmPassword}
                    onChange={handleInputChange}
                  />
                  {errors.confirmPassword && (
                    <p className="text-sm text-red-600">
                      {errors.confirmPassword}
                    </p>
                  )}
                </div>

                <button
                  type="submit"
                  className="w-full text-white bg-red-400 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                >
                  Create an account
                </button>

                <p className="text-sm font-light text-gray-500 dark:text-gray-400">
                  Already have an account?{" "}
                  <button
                    className="font-medium text-primary-600 hover:underline dark:text-primary-500"
                    onClick={(e) => {
                      e.preventDefault();
                      setSegmentUsecase.execute({ segment: Pages.LOGIN });
                    }}
                  >
                    Login here
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
