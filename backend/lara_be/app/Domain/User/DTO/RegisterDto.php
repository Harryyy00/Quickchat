<?php
namespace App\Domain\User\DTO;

class RegisterDto
{
    public string $name;
    public string $userName;
    public string $password;
    public ? string $profilePictureBlob;
    public function __construct(
        string $name,
        string $userName,
        string $password,
        ?string $profilePictureBlob,
    ){
        $this->name = $name;
        $this->userName = $userName;
        $this->password = $password;
        $this->profilePictureBlob = $profilePictureBlob;
    }
}