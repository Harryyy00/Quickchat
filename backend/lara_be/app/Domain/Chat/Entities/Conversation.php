<?php
namespace App\Domain\Chat\Entities;

class Conversation
{
    public string $id;
    public string $sender;
    public string $recipient;
    public string $timeStamp;
    public string $lastMessage;
    public string $conversationsId;

    public function __construct(
        string $id, 
        string $sender, 
        string $recipient, 
        string $timeStamp,  
        string $lastMessage,
        string $conversationsId,
    ){
        $this->id = $id;
        $this->sender = $sender;
        $this->recipient = $recipient;
        $this->timeStamp = $timeStamp;
        $this->lastMessage = $lastMessage;
        $this->conversationsId = $conversationsId;
    }
}
