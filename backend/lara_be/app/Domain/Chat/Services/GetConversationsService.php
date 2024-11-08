<?php
namespace App\Domain\Chat\Services;

use App\Domain\Chat\Repositories\ChatRepository;
use App\Domain\Chat\DTO\GetConversationsDto;
use App\Utils\Either;

class GetConversationsService
{
    private ChatRepository $repository;

    public function __construct(ChatRepository $repository)
    {
        $this->repository = $repository;
    }

    public function execute(GetConversationsDto $getConversationsDto): Either
    {
        return $this->repository->getConversations(getConversationsDto: $getConversationsDto);
    }
}
