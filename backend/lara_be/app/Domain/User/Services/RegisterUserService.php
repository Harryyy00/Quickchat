<?php
namespace App\Domain\User\Services;

use App\Domain\User\DTO\RegisterDto;
use App\Domain\User\Repositories\UserRepository;
use App\Utils\Either;

class RegisterUserService{
    private UserRepository $userRepository;

    public function __construct(UserRepository $userRepository){
        $this->userRepository = $userRepository;  
    }

    public function register(RegisterDto $registerDto):Either{
        return $this->userRepository->registerUser(registerDto: $registerDto);
    }
}