<?php

namespace App\Domain\Chat\Services;

use App\Domain\Chat\DTO\SendMessageDto;

class ChatSseService
{
    private array $clients = [];

    public function addClient(string $username, $response)
    {
        if (!isset($this->clients[$username])) {
            $this->clients[$username] = [];
        }
        $this->clients[$username][] = $response;
    }

    public function removeClient(string $username, $response)
    {
        if (isset($this->clients[$username])) {
            $this->clients[$username] = array_filter(
                $this->clients[$username],
                fn($client) => $client !== $response
            );
    
            if (empty($this->clients[$username])) {
                unset($this->clients[$username]);
            }
        }
    }
    

    public function broadcastMessage(SendMessageDto $message)
    {
        $recipientClients = $this->clients[$message->recipient] ?? [];
        $senderClients = $this->clients[$message->sender] ?? [];
    
        foreach (array_merge($recipientClients, $senderClients) as $client) {
            echo "data: " . json_encode($message) . "\n\n";
            flush();  // Ensure the data is sent immediately
        }
    }
    
}
