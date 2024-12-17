<?php

namespace App\Domain\Auth\DTO;
use App\Domain\User\Entities\UserEntity;


class LoggedDataDto
{
    public int $statusCode;
    public string $token;
    public UserEntity $user;

    public function __construct(int $statusCode, string $token, UserEntity $user)
    {
        $this->statusCode = $statusCode;
        $this->token = $token;
        $this->user = $user;
    }
}

