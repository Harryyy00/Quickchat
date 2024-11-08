<?php

namespace App\Domain\Auth\DTO;
use App\Domain\User\Entities\User;


class LoggedDataDto
{
    public int $statusCode;
    public string $token;
    public User $user;

    public function __construct(int $statusCode, string $token, User $user)
    {
        $this->statusCode = $statusCode;
        $this->token = $token;
        $this->user = $user;
    }
}

