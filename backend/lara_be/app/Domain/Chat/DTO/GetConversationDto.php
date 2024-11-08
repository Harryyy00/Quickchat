<?php

namespace App\Domain\Chat\DTO;

class GetConversationDto
{
    public string $userName;
    public int $page;

    public function __construct(string $userName, int $page)
    {
        $this->userName = $userName;
        $this->page = $page;
    }
}
