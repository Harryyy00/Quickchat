<?php
namespace App\Domain\Chat\Repositories;

use App\Domain\Chat\DTO\GetConversationDto;
use App\Domain\Chat\DTO\GetConversationsDto;
use App\Domain\Chat\DTO\SendMessageDto;
use App\Utils\Either;

interface ChatRepository
{
    public function sendMessage(SendMessageDto $sendMessageDto) : Either;
    public function getConversation(GetConversationDto $getConversationDto) : Either;
    public function getConversations(GetConversationsDto $getConversationsDto) : Either;
}
