<?php
namespace App\Domain\User\Entities;

class User
{
    public string $id;
    public string $name;
    public string $userName;
    public ?string $profilePictureBlob;

    public function __construct(string $id, string $name, string $userName, ?string $profilePictureBlob)
    {
        $this->id = $id;
        $this->name = $name;
        $this->userName = $userName;
        $this->profilePictureBlob = $profilePictureBlob;
    }
}
