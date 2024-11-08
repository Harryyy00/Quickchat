<?php
namespace App\Domain\User\Repositories;
use App\Domain\User\DTO\RegisterDto;
use App\Domain\User\DTO\SearchUsersDto;
use App\Utils\Either;


interface UserRepository {
    public function registerUser(RegisterDto $registerDto) : Either;
    public function searchUsers(SearchUsersDto $searchUsersDto) : Either;
    public function getUser(String $userId) : Either;
}