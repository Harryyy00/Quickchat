<?php
namespace App\Domain\Auth\DTO;

class LoginDto
{
    public string $userName;
    public string $password;

    public function __construct(string $userName, string $password)
    {
        $this->userName = $userName;
        $this->password = $password;
    }
}
