<?php

namespace App\Domain\Chat\DTO;
use App\Domain\Chat\Entities\Conversation;

class ConversationResultDto
{
    public int $currentPage;
    public int $maxPage;

    // must be a list of entity
    /** @var Conversation[] */
    public array $conversationList;

    public function __construct(int $currentPage, int $maxPage, array $conversationList)
    {
        $this->currentPage = $currentPage;
        $this->maxPage = $maxPage;
        $this->conversationList = $conversationList;
    }
}
