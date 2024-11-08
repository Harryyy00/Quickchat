<?php
namespace App\Domain\Chat\Services;

use App\Domain\Chat\DTO\SendMessageDto;
use App\Domain\Chat\Repositories\ChatRepository;
use App\Domain\Chat\DTO\GetConversationDto;
use App\Utils\Either;

class SendMessageService
{
    private ChatRepository $repository;

    public function __construct(ChatRepository $repository)
    {
        $this->repository = $repository;
    }

    public function execute(SendMessageDto $sendMessageDto): Either
    {
        return $this->repository->sendMessage($sendMessageDto );
    }
}
