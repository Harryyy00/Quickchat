<?php

namespace App\Domain\Chat\DTO;

class SendMessageDto
{
    public string $sender;
    public string $recipient;
    public string $content;
    public string $sentAt;

    public function __construct(
        string $sender, 
        string $recipient,
        string $content, 
        string $sentAt
    ){
        $this->sender = $sender;
        $this->recipient = $recipient;
        $this->content = $content;
        $this->sentAt = $sentAt;
    }
}
