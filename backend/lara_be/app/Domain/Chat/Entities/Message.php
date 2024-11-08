<?php
namespace App\Domain\Chat\Entities;

class Message
{
    public string $id;
    public string $sender;
    public string $recipient;
    public string $sentAt;
    public string $content;

    public function __construct(
        string $id,
        string $sender, 
        string $recipient, 
        string $sentAt,  
        string $content,
    ){
        $this->id = $id;
        $this->sender = $sender;
        $this->recipient = $recipient;
        $this->sentAt = $sentAt;
        $this->content = $content;
    }
}
