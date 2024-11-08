<?php
namespace App\Domain\Chat\Services;

use App\Domain\Chat\Repositories\ChatRepository;
use App\Domain\Chat\DTO\GetConversationDto;
use App\Utils\Either;

class GetConversationService
{
    private ChatRepository $repository;

    public function __construct(ChatRepository $repository)
    {
        $this->repository = $repository;
    }

    public function execute(GetConversationDto $getConversationDto): Either
    {
        return $this->repository->getConversation(getConversationDto: $getConversationDto);
    }
}
