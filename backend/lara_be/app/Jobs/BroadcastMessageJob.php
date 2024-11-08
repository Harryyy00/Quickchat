<?php

namespace App\Jobs;

use App\Domain\Chat\DTO\SendMessageDto;
use App\Domain\Chat\Services\ChatSseService;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;

class BroadcastMessageJob implements ShouldQueue
{
    use Queueable;

    protected ChatSseService $chatSseService;

    protected SendMessageDto $messageData;

    /**
     * Create a new job instance.
     */
    public function __construct(
        ChatSseService $chatSseService,
        SendMessageDto $messageData,
    )
    {
        $this->chatSseService = $chatSseService;
        $this->messageData = $messageData;
    }

    /**
     * Execute the job.
     */
    public function handle(ChatSseService $chatSseService): void
    {
        $chatSseService->broadcastMessage($this->messageData);
    }
}
