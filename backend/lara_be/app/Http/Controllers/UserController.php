<?php

namespace App\Http\Controllers;

use App\Domain\User\DTO\RegisterDto;
use App\Domain\User\DTO\SearchUsersDto;
use App\Domain\User\Services\RegisterUserService;
use App\Domain\User\Services\SearchUsersService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    private RegisterUserService $registerUserService;
    private SearchUsersService $searchUsersService;

    public function __construct(RegisterUserService $registerUserService, SearchUsersService $searchUsersService)
    {
        $this->registerUserService = $registerUserService;
        $this->searchUsersService = $searchUsersService;
    }

    public function registerUser(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'userName' => 'required|string|max:255',
            'password' => 'required|string|min:8|max:30|confirmed', // password confirmation [password_confirmation] default
            'profilePictureBlob' => 'nullable|string',
        ]);

        // return error response if validation fails
        if ($validator->fails()) {
            return response()->json(data: [
                'errors' => ['message' => $validator->errors()->first()]
            ], status: 400);
        }

        // create a register data object using validated data
        $registerUserData = new RegisterDto(
            name: $request->input('name'),
            userName: $request->input('userName'),
            password: $request->input('password'),
            profilePictureBlob: $request->input('profilePictureBlob')
        );

        // Call the service to register the user
        $result = $this->registerUserService->register($registerUserData);

        // If the result is successful, return a success response
        if ($result->isRight()) {
            return response()->json([
                'data' => ['message' => $result->unwrap()]
            ], 201);
        }

        // If the result is an error, return an error response
        return response()->json([
            'errors' => $result->unwrap()
        ], $result->unwrap()->statusCode ?? 400);
    }

    public function searchUsers(Request $request): JsonResponse {
        $validator = Validator::make($request->all(), [
            'searchQuery' => 'required|string|max:255',
            'page' => 'required|int',
        ]);

        // return error response if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => ['message' => $validator->errors()->first()]
            ], 400);
        }

        $searchUserData = new SearchUsersDto(
            searchQuery: $request->input('searchQuery'),
            page: $request->input('page'),
        );

        // Call the service to register the user
        $result = $this->searchUsersService->searchUsers($searchUserData);

        // If the result is successful, return a success response
        if ($result->isRight()) {
            return response()->json([
                'data' => $result->unwrap(),
            ], 200);
        }

        // If the result is an error, return an error response
        return response()->json([
            'errors' => $result->unwrap()
        ], $result->unwrap()->statusCode ?? 400);
    }

    public function getUser(Request $request): JsonResponse {
        $validator = Validator::make($request->all(), [
            'userId' => 'required|string|max:255',
        ]);

        // return error response if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => ['message' => $validator->errors()->first()]
            ], 400);
        }

        // Call the service to register the user
        $result = $this->searchUsersService->getUser($request->input('userId'));

        // If the result is successful, return a success response
        if ($result->isRight()) {
            return response()->json([
                'data' => $result->unwrap(),
            ], 200);
        }

        // If the result is an error, return an error response
        return response()->json([
            'errors' => $result->unwrap()
        ], $result->unwrap()->statusCode ?? 400);
    }
}
