<?
namespace App\Http\Controllers;

use App\Domain\Auth\Entities\ErrorResponse;
use App\Domain\Chat\DTO\GetConversationDto;
use App\Domain\Chat\DTO\GetConversationsDto;
use App\Domain\Chat\DTO\SendMessageDto;
use App\Domain\Chat\Services\ChatSseService;
use App\Domain\Chat\Services\GetConversationService;
use App\Domain\Chat\Services\GetConversationsService;
use App\Domain\Chat\Services\SendMessageService;
use App\Events\PusherBroadcast;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Spatie\Async\Pool;


class ChatController extends Controller
{   

    private ChatSseService $chatSseService;
    private GetConversationService $getConversationService;
    private GetConversationsService $getConversationsService;
    private SendMessageService $sendMessageService;

    public function __construct(
        ChatSseService $chatSseService,
        GetConversationService $getConversationService,
        GetConversationsService $getConversationsService,
        SendMessageService $sendMessageService,
    ){
        $this->chatSseService = $chatSseService;
        $this->getConversationService = $getConversationService;
        $this->getConversationsService = $getConversationsService;
        $this->sendMessageService = $sendMessageService;
    }
  

    public function sse(Request $request)
    {
        $user = $request->attributes->get('user');
    
        if (!$user || !property_exists($user, 'userName')) {
            return response()->json(['errors' => 'User information not found'], 403);
        }
    
        $username = $user->userName;
    
        $response = new StreamedResponse(function () use ($username, &$response) {
            while (true) {
                // Keep-alive ping
                echo "data: ping\n\n";
                flush();
    
                if (connection_aborted()) {
                    $this->chatSseService->removeClient($username, $response);
                    break;
                }
    
                usleep(500000);  // Prevent 100% CPU usage
            }
        });
    
        // Set headers for SSE
        $response->headers->set('Content-Type', 'text/event-stream');
        $response->headers->set('Cache-Control', 'no-cache');
        $response->headers->set('Connection', 'keep-alive');
    
        $this->chatSseService->addClient($username, $response);
    
        return $response;
    }

    public function sendMessage(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'recipient' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => new ErrorResponse(
                    400,
                    $validator->errors()->first()
                )
            ], 400);
        }

        $user = $request->attributes->get('user');

        if (!$user || !property_exists($user, 'userName')) {
            return response()->json(['errors' => 'User information not found'], 403);
        }

        $messageData = new SendMessageDto(
            $user->userName,
            $request->input('recipient'),
            $request->input('content'),
            date("Y-m-d H:i:s")
        );

        $result = $this->sendMessageService->execute($messageData);

        if ($result->isRight()) {
            // $this->chatSseService->broadcastMessage($messageData);
            event(new PusherBroadcast($messageData));
            return response()->json(['data' => $result->unwrap()], 201);
        }

        return response()->json(['errors' => $result->unwrap()], 400);
    }


    public function getConversation(Request $request): JsonResponse
    {
        $validator = Validator::make(data: $request->all(), rules: [
            'page' => 'required|int',
        ]);

        if ($validator->fails()) {
            return response()->json(data: [
                'errors' => new ErrorResponse(
                    statusCode: 400,
                    errorMessage: $validator->errors()->first(),
                )
            ], status: 400);
        }

        // Get the user information from the request attributes
        $user = $request->attributes->get(key: 'user');

        if (!$user || !property_exists(object_or_class: $user, property: 'userName')) {
            return response()->json(['errors' => 'User information not found'], 403);
        }

        $getConversationData = new GetConversationDto(
            userName: $user->userName,
            page: $request->input('page'),
        );

        $result = $this->getConversationService->execute(getConversationDto: $getConversationData);

        if ($result->isRight()) {
            return response()->json(data: ['data' => $result->unwrap()], status: 200);
        }

        return response()->json(data: ['errors' => $result->unwrap()], status: 400);
    }

    public function getConversations(Request $request): JsonResponse
    {
        $validator = Validator::make(data: $request->all(), rules: [
            'conversationsId' => 'required|string|max:255',
            'page' => 'required|int',
        ]);

        if ($validator->fails()) {
            return response()->json(data: [
                'errors' => new ErrorResponse(
                    statusCode: 400,
                    errorMessage: $validator->errors()->first(),
                )
            ], status: 400);
        }

    

        $getConversationsData = new GetConversationsDto(
            conversationsId:  $request->input('conversationsId'),
            page: $request->input('page'),
        );

        $result = $this->getConversationsService->execute(getConversationsDto: $getConversationsData);

        if ($result->isRight()) {
            return response()->json(data: ['data' => $result->unwrap()], status: 200);
        }

        return response()->json(data: ['errors' => $result->unwrap()], status: 400);
    }
}
