<?php

namespace App\Domain\Chat\DTO;

class GetConversationsDto
{
    public string $conversationsId;
    public int $page;

    public function __construct(string $conversationsId, int $page)
    {
        $this->conversationsId = $conversationsId;
        $this->page = $page;
    }
}
