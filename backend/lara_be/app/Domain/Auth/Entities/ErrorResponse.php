<?php
namespace App\Domain\Auth\Entities;

class ErrorResponse
{
    public int $statusCode;
    public string $errorMessage;

    public function __construct(int $statusCode, string $errorMessage)
    {
        $this->statusCode = $statusCode;
        $this->errorMessage = $errorMessage;
       
    }
}
