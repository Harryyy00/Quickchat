<?php


use App\Http\Controllers\ChatController;
use App\Http\Middleware\AuthenticateToken;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;


/// Auth
Route::post('/login', [AuthController::class, 'login']);

/// User
Route::post('/register', [UserController::class, 'registerUser']);
Route::get('/search', [UserController::class, 'searchUsers'])->middleware(AuthenticateToken::class);
Route::get('/getUser', [UserController::class, 'getUser'])->middleware(AuthenticateToken::class);

/// Chat
Route::get('/conversation', [ChatController::class, 'getConversation'])->middleware(AuthenticateToken::class);
Route::get('/conversations', [ChatController::class, 'getConversations'])->middleware(AuthenticateToken::class);

// Route::middleware('auth:sanctum')->group(function () {
Route::get('/chat/events', [ChatController::class, 'sse'])->middleware(AuthenticateToken::class);
Route::post('/chat/send', [ChatController::class, 'sendMessage'])->middleware(AuthenticateToken::class);
// });
// Route::post('/send', [ChatController::class, 'sendMessage'])->middleware(AuthenticateToken::class);



Route::get('/test', function(){
    return 'test';
});
