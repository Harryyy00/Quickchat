<?php
namespace App\Infastructure\Repository;

use App\Domain\Chat\DTO\ConversationResultDto;
use App\Domain\Chat\DTO\ConversationsResultDto;
use App\Domain\Chat\DTO\GetConversationDto;
use App\Domain\Chat\DTO\GetConversationsDto;
use App\Domain\Chat\DTO\SendMessageDto;
use App\Domain\Chat\Entities\ConversationEntity;
use App\Domain\Chat\Entities\MessageEntity;
use App\Infastructure\Eloquent\User;
use App\Infastructure\Eloquent\Conversation;
use App\Infastructure\Eloquent\Message;
use App\Domain\Chat\Repositories\ChatRepository;
use App\Utils\Either;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ChatRepositoryImpl implements ChatRepository{
    public function sendMessage(SendMessageDto $messageDto): Either
    {
        try {
            // Check if both sender and recipient are valid users
            $sender = User::where('userName', $messageDto->sender)->first();
            $recipient = User::where('userName', $messageDto->recipient)->first();

            if (!$sender || !$recipient) {
                $errorResponse = [
                    'statusCode' => 400,
                    'errorMessage' => (!$sender ? 'Sender' : 'Recipient') . ' is invalid',
                ];
                return Either::left($errorResponse);
            }

            // Check for existing conversation between sender and recipient using the UUID conversation_id
            $conversation = Conversation::where(function ($query) use ($messageDto) {
                    $query->where('sender', $messageDto->sender)
                        ->where('recipient', $messageDto->recipient);
                })
                ->orWhere(function ($query) use ($messageDto) {
                    $query->where('sender', $messageDto->recipient)
                        ->where('recipient', $messageDto->sender);
                })
                ->first();

            if ($conversation) {
                // Update the conversation
                $conversation->update([
                    'last_message' => $messageDto->content,
                    'last_message_time' => $messageDto->sentAt,
                ]);

                // Save the message
                Message::create([
                    'conversation_id' => $conversation->conversation_id,
                    'sender' => $messageDto->sender,
                    'recipient' => $messageDto->recipient,
                    'content' => $messageDto->content,
                    'sent_at' => $messageDto->sentAt,
                ]);

                return Either::right('Message Sent');
            }

            // If no conversation exists, create a new one
            DB::transaction(function () use ($messageDto, &$messageId) {
                // Generate UUID for the conversation_id
                $conversationId = Str::uuid()->toString();

                // Create the conversation
                $conversation = Conversation::create([
                    'sender' => $messageDto->sender,
                    'recipient' => $messageDto->recipient,
                    'last_message' => $messageDto->content,
                    'last_message_time' => $messageDto->sentAt,
                    'conversation_id' => $conversationId,
                ]);

                // Create the message using the same UUID
                $message = Message::create([
                    'conversation_id' => $conversation->conversation_id,
                    'sender' => $messageDto->sender,
                    'recipient' => $messageDto->recipient,
                    'content' => $messageDto->content,
                    'sent_at' => $messageDto->sentAt,
                ]);

                $messageId = $message->id;
            });

            return Either::right('Message Sent');
        } catch (\Exception $e) {
            $errorResponse = [
                'statusCode' => 500,
                'errorMessage' => 'Message Not Sent: ' . $e->getMessage(),
            ];
            return Either::left($errorResponse);
        }
    }
    // public function sendMessage(SendMessageDto $messageDto): Either
    // {
    //     try {
    //         // Check if both sender and recipient are valid users
    //         $sender = DB::table('users')
    //             ->where('userName', $messageDto->sender)
    //             ->first();

    //         $recipient = DB::table('users')
    //             ->where('userName', $messageDto->recipient)
    //             ->first();

    //         if (!$sender || !$recipient) {
    //             $errorResponse = [
    //                 'statusCode' => 400,
    //                 'errorMessage' => (!$sender ? 'Sender' : 'Recipient') . ' is invalid',
    //             ];
    //             return Either::left($errorResponse);
    //         }

    //         // Check for existing conversation between sender and recipient using the UUID conversation_id
    //         $conversation = DB::table('conversations')
    //             ->where(function ($query) use ($messageDto) {
    //                 $query->where('sender', $messageDto->sender)
    //                     ->where('recipient', $messageDto->recipient);
    //             })
    //             ->orWhere(function ($query) use ($messageDto) {
    //                 $query->where('sender', $messageDto->recipient)
    //                     ->where('recipient', $messageDto->sender);
    //             })
    //             ->first();

    //         // If the conversation exists, update it
    //         if ($conversation) {
    //             DB::table('conversations')
    //                 ->where('conversation_id', $conversation->conversation_id) // Use the UUID conversation_id
    //                 ->update([
    //                     'last_message' => $messageDto->content,
    //                     'last_message_time' => $messageDto->sentAt,
    //                 ]);

    //             // Save the message to the messages table with the UUID conversation_id
    //             $messageId = DB::table('messages')->insertGetId([
    //                 'conversation_id' => $conversation->conversation_id, // Use UUID
    //                 'sender' => $messageDto->sender,
    //                 'recipient' => $messageDto->recipient,
    //                 'content' => $messageDto->content,
    //                 'sent_at' => $messageDto->sentAt,
    //             ]);

    //             // Return the ID of the saved message
    //             return Either::right('Message Sent');
    //         }

    //         // If no conversation exists, create a new one
    //         DB::transaction(function () use ($messageDto, &$messageId) {
    //             // Generate UUID for the conversation_id
    //             $conversationId = Str::uuid()->toString();

    //             // Create the conversation
    //             DB::table('conversations')->insert([
    //                 'sender' => $messageDto->sender,
    //                 'recipient' => $messageDto->recipient,
    //                 'last_message' => $messageDto->content,
    //                 'last_message_time' => $messageDto->sentAt,
    //                 'conversation_id' => $conversationId, // Use the generated UUID
    //             ]);

    //             // Create the message using the same UUID
    //             $messageId = DB::table('messages')->insertGetId([
    //                 'conversation_id' => $conversationId, // Use the same UUID
    //                 'sender' => $messageDto->sender,
    //                 'recipient' => $messageDto->recipient,
    //                 'content' => $messageDto->content,
    //                 'sent_at' => $messageDto->sentAt,
    //             ]);
    //         });

    //         // Return the ID of the saved message
    //         return Either::right('Message Sent');

    //     } catch (\Exception $e) {
    //         $errorResponse = [
    //             'statusCode' => 500,
    //             'errorMessage' => 'Message Not Sent: ' . $e->getMessage(),
    //         ];
    //         return Either::left($errorResponse);
    //     }
    // }

    public function getConversation(GetConversationDto $getConversationDto): Either
    {
        try {
            $userName = $getConversationDto->userName;
            $page = $getConversationDto->page;
            $pageSize = 20; // Default page size

            // Fetch conversations where the user is either sender or recipient
            $conversationQuery = Conversation::where('sender', $userName)
                ->orWhere('recipient', $userName)
                ->orderBy('last_message_time', 'desc');

            $totalItems = $conversationQuery->count();
            $maxPage = ceil($totalItems / $pageSize);

            // If the requested page exceeds the max pages
            if ($page > $maxPage && $maxPage > 0) {
                return Either::left([
                    'statusCode' => 404,
                    'errorMessage' => 'Page number exceeds maximum pages',
                ]);
            }

            // Fetch paginated results
            $conversationList = $conversationQuery
                ->skip(($page - 1) * $pageSize)
                ->take($pageSize)
                ->get();

            // Map results to Conversation entities
            $conversationEntities = $conversationList->map(function ($conversation): ConversationEntity {
                return new ConversationEntity(
                    id: $conversation->id,
                    sender: $conversation->sender,
                    recipient: $conversation->recipient,
                    timeStamp: $conversation->last_message_time, // Use correct column here
                    lastMessage: $conversation->last_message,
                    conversationsId: $conversation->conversation_id // UUID column
                );
            })->toArray();

            // Create the result DTO
            $conversationResult = new ConversationResultDto($page, $maxPage, $conversationEntities);

            return Either::right($conversationResult);
        } catch (\Exception $e) {
            return Either::left([
                'statusCode' => 500,
                'errorMessage' => 'An error occurred while retrieving conversations: ' . $e->getMessage(),
            ]);
        }
    }

    // public function getConversation(GetConversationDto $getConversationDto): Either
    // {
    //     try {
    //         $userName = $getConversationDto->userName;
    //         $page = $getConversationDto->page;
    //         $pageSize = 20; // Default page size

    //         // Fetch conversations where the user is either sender or recipient
    //         $conversationQuery = DB::table('conversations')
    //             ->where('sender', $userName)
    //             ->orWhere('recipient', $userName)
    //             ->orderBy('last_message_time', 'desc'); // Correct column name here

    //         $totalItems = $conversationQuery->count();
    //         $maxPage = ceil($totalItems / $pageSize);

    //         // If the requested page exceeds the max pages
    //         if ($page > $maxPage && $maxPage > 0) {
    //             return Either::left([
    //                 'statusCode' => 404,
    //                 'errorMessage' => 'Page number exceeds maximum pages',
    //             ]);
    //         }

    //         // Fetch paginated results
    //         $conversationList = $conversationQuery
    //             ->skip(($page - 1) * $pageSize)
    //             ->take($pageSize)
    //             ->get();

    //         // Map results to Conversation entities
    //         $conversationEntities = $conversationList->map(function ($conversation): ConversationEntity {
    //             return new ConversationEntity(
    //                 id: $conversation->id,
    //                 sender: $conversation->sender,
    //                 recipient: $conversation->recipient,
    //                 timeStamp: $conversation->last_message_time, // Use correct column here
    //                 lastMessage: $conversation->last_message,
    //                 conversationsId: $conversation->conversation_id // UUID column
    //             );
    //         })->toArray();

    //         // Create the result DTO
    //         $conversationResult = new ConversationResultDto($page, $maxPage, $conversationEntities);

    //         return Either::right($conversationResult);
    //     } catch (\Exception $e) {
    //         return Either::left([
    //             'statusCode' => 500,
    //             'errorMessage' => 'An error occurred while retrieving conversations: ' . $e->getMessage(),
    //         ]);
    //     }
    // }

    public function getConversations(GetConversationsDto $getConversationsDto): Either
    {
        try {
            $conversationId = $getConversationsDto->conversationsId; // UUID of the conversation
            $page = $getConversationsDto->page;
            $pageSize = 20; // Default page size

            // Fetch messages by conversation_id (UUID) using Eloquent
            $messagesQuery = Message::where('conversation_id', $conversationId)
                ->orderBy('sent_at', 'desc'); // Correct column name: sent_at

            $totalItems = $messagesQuery->count();
            $maxPage = ceil($totalItems / $pageSize);

            // If the requested page exceeds the max pages
            if ($page > $maxPage && $maxPage > 0) {
                return Either::left([
                    'statusCode' => 404,
                    'errorMessage' => 'Page number exceeds maximum pages',
                ]);
            }

            // Fetch paginated results
            $messagesList = $messagesQuery
                ->skip(($page - 1) * $pageSize)
                ->take($pageSize)
                ->get();

            // Map the paginated messages to the Message entity
            $messageEntities = $messagesList->map(function ($message): MessageEntity {
                return new MessageEntity(
                    id: $message->id,
                    sender: $message->sender,
                    recipient: $message->recipient,
                    sentAt: $message->sent_at, // Corrected: sent_at
                    content: $message->content
                );
            })->toArray();

            // Reverse the message order for display
            $reversedMessageEntities = array_reverse($messageEntities);

            // Create the result DTO
            $conversationsResult = new ConversationsResultDto($page, $maxPage, $reversedMessageEntities);

            return Either::right($conversationsResult);
        } catch (\Exception $e) {
            return Either::left([
                'statusCode' => 500,
                'errorMessage' => 'An error occurred while retrieving conversations: ' . $e->getMessage(),
            ]);
        }
    }

    // public function getConversations(GetConversationsDto $getConversationsDto): Either
    // {
    //     try {
    //         $conversationsId = $getConversationsDto->conversationsId; // UUID of the conversation
    //         $page = $getConversationsDto->page;
    //         $pageSize = 20; // Default page size

    //         // Fetch messages by conversation_id (UUID)
    //         $conversationsQuery = DB::table('messages')
    //             ->where('conversation_id', $conversationsId)
    //             ->orderBy('sent_at', 'desc'); // Correct column name: sent_at


    //         $totalItems = $conversationsQuery->count();
    //         $maxPage = ceil($totalItems / $pageSize);

    //         // If the requested page exceeds the max pages
    //         if ($page > $maxPage) {
    //             return Either::left([
    //                 'statusCode' => 404,
    //                 'errorMessage' => 'Page number exceeds maximum pages'
    //             ]);
    //         }

    //         // Fetch paginated results
    //         $conversationsList = $conversationsQuery
    //             ->skip(($page - 1) * $pageSize)
    //             ->take($pageSize)
    //             ->get();

            

    //         // Map the paginated messages to the Message entity
    //         $messageEntities = $conversationsList->map(function ($message): MessageEntity {
    //             return new MessageEntity(
    //                 id: $message->id,
    //                 sender: $message->sender,
    //                 recipient: $message->recipient,
    //                 sentAt: $message->sent_at, // Corrected: sent_at
    //                 content: $message->content
    //             );
    //         })->toArray();

    //         $reversedMessageEntities = array_reverse($messageEntities);

    //         // Create the result DTO
    //         $conversationsResult = new ConversationsResultDto($page, $maxPage, $reversedMessageEntities);

    //         return Either::right($conversationsResult);
    //     } catch (\Exception $e) {
    //         return Either::left([
    //             'statusCode' => 500,
    //             'errorMessage' => 'An error occurred while retrieving conversations: ' . $e->getMessage(),
    //         ]);
    //     }
    // }
}