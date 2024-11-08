<?php
namespace App\Domain\Auth\Repositories;

use App\Domain\Auth\DTO\LoginDto;
use App\Utils\Either;

interface AuthenticationRepository
{
    public function login(LoginDto $loginDto) : Either;
}
