<?php

namespace App\Domain\Chat\DTO;
use App\Domain\Chat\Entities\Message;

class ConversationsResultDto
{
    public int $currentPage;
    public int $maxPage;

    // must be a list of entity
    /** @var Message[] */
    public array $conversationsList;

    public function __construct(int $currentPage, int $maxPage, array $conversationsList)
    {
        $this->currentPage = $currentPage;
        $this->maxPage = $maxPage;
        $this->conversationsList = $conversationsList;
    }
}