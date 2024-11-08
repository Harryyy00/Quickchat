<?php
namespace App\Domain\Auth\Services;

use App\Domain\Auth\Repositories\AuthenticationRepository;
use App\Domain\Auth\DTO\LoginDto;
use App\Utils\Either;

class LoginUserService
{
    private AuthenticationRepository $repository;

    public function __construct(AuthenticationRepository $repository)
    {
        $this->repository = $repository;
    }

    public function execute(LoginDto $loginDto): Either
    {
        return $this->repository->login($loginDto);
    }
}
