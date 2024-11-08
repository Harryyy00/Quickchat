<?php
namespace App\Domain\User\Services;

use App\Domain\User\DTO\RegisterDto;
use App\Domain\User\DTO\SearchUsersDto;
use App\Domain\User\Repositories\UserRepository;
use App\Utils\Either;

class SearchUsersService{
    private UserRepository $userRepository;

    public function __construct(UserRepository $userRepository){
        $this->userRepository = $userRepository;  
    }

    public function searchUsers(SearchUsersDto $searchUsersDto):Either{
        return $this->userRepository->searchUsers(searchUsersDto: $searchUsersDto);
    }
    public function getUser(String $userId):Either{
        return $this->userRepository->getUser(userId: $userId);
    }
    
}