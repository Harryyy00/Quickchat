<?php
namespace App\Infastructure\Repository;

use App\Domain\User\DTO\RegisterDto;
use App\Domain\User\DTO\SearchUsersDto;
use App\Domain\User\DTO\SearchedUsersResultDto;
use App\Domain\User\Entities\UserEntity;
use App\Domain\User\Repositories\UserRepository;
use App\Domain\Auth\Entities\ErrorResponse;
use App\Infastructure\Eloquent\User;
use App\Infastructure\Eloquent\Conversation;
use App\Infastructure\Eloquent\Message;
use App\Utils\Either;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UserRepositoryImpl implements UserRepository
{
    public function registerUser(RegisterDto $registerDto): Either
    {
        try {
            // Check if the user already exists
            $existingUser = User::where('userName', $registerDto->userName)->first();

            if ($existingUser) {
                $errorResponse = new ErrorResponse(
                    statusCode: 400,
                    errorMessage: 'User already exists, try another username'
                );
                return Either::left($errorResponse);
            }

            // Hash the user's password
            $hashedPassword = Hash::make($registerDto->password);

            // Create the new user
            User::create([
                'name' => $registerDto->name,
                'userName' => $registerDto->userName,
                'password' => $hashedPassword,
                'profilePictureBlob' => $registerDto->profilePictureBlob,
                'requests' => json_encode([]), // Default empty array
                'connections' => json_encode([]), // Default empty array
            ]);

            return Either::right('created');
        } catch (\Exception $e) {
            $errorResponse = new ErrorResponse(
                statusCode: 500,
                errorMessage: 'An error occurred while registering the user: ' . $e->getMessage()
            );
            return Either::left($errorResponse);
        }
    }

    // public function registerUser(RegisterDto $registerDto): Either
    // {
    //     // check if user already exists
    //     $existingUser = DB::table(table: 'users')
    //         ->where(column: 'userName', operator: $registerDto->userName)
    //         ->first();

    //     if ($existingUser) {
    //         $errorResponse = new ErrorResponse(
    //             statusCode: 400,
    //             errorMessage: 'User already exists, try another username',
    //         );
            
    //         return Either::left($errorResponse);
    //     }

    //     // user hashed password
    //     $hashedPassword = Hash::make(value: $registerDto->password);

    //     DB::table(table: 'users')->insert(values: [
    //         'name' => $registerDto->name,
    //         'userName' => $registerDto->userName,
    //         'password' => $hashedPassword,
    //         'profilePictureBlob' => $registerDto->profilePictureBlob,
    //         // additional fields for user requests and connections data
    //         'requests' => json_encode([]),
    //         'connections' => json_encode([]),
    //     ]);

    //     return Either::right('created');
    // }

    private const PAGE_SIZE = 10; // Default page size
    public function searchUsers(SearchUsersDto $searchUsersDto): Either
    {
        try {
            // Perform a case-insensitive search using Eloquent
            $query = User::where('userName', 'like', "%{$searchUsersDto->searchQuery}%");

            // Fetch the total count of matching users
            $totalUsers = $query->count();

            // Calculate the maximum page number
            $maxPage = ceil($totalUsers / self::PAGE_SIZE);

            // If no users are found, return an empty result
            if ($totalUsers === 0) {
                $searchedUsersResult = new SearchedUsersResultDto(
                    currentPage: $searchUsersDto->page,
                    maxPage: $maxPage,
                    users: [],
                );
                return Either::right($searchedUsersResult);
            }

            // If the requested page exceeds the max page, return an error response
            if ($searchUsersDto->page > $maxPage) {
                return Either::left([
                    'statusCode' => 404,
                    'errorMessage' => 'Page number exceeds maximum pages',
                ]);
            }

            // Calculate how many users to skip for pagination
            $skip = ($searchUsersDto->page - 1) * self::PAGE_SIZE;

            // Fetch paginated user data using Eloquent
            $userRecords = $query->skip($skip)->take(self::PAGE_SIZE)->get();

            // Map user data to UserEntity
            $users = $userRecords->map(function ($user): UserEntity {
                return new UserEntity(
                    id: (string) $user->id,
                    name: $user->name,
                    userName: $user->userName,
                    profilePictureBlob: $user->profilePictureBlob
                );
            })->toArray();

            // Create and return the result DTO
            $searchedUsersResult = new SearchedUsersResultDto(
                currentPage: $searchUsersDto->page,
                maxPage: $maxPage,
                users: $users,
            );

            return Either::right($searchedUsersResult);

        } catch (\Exception $e) {
            // Error response in case of exception
            return Either::left([
                'statusCode' => 500,
                'errorMessage' => 'An error occurred while searching for users: ' . $e->getMessage(),
            ]);
        }
    }
    // public function searchUsers(SearchUsersDto $searchUsersDto): Either
    // {
    //     try {
    //         // Case-insensitive search for users
    //         $query = DB::table('users')
    //             ->where('userName', 'like', "%{$searchUsersDto->searchQuery}%");

    //         // Fetch the total count of matching users
    //         $totalUsers = $query->count();



    //         // Calculate the maximum page number
    //         $maxPage = ceil($totalUsers / self::PAGE_SIZE);

    //         // If no users found, return an error response
    //         if ($totalUsers === 0) {
    //             $searchedUsersResult = new SearchedUsersResultDto(
    //                 currentPage: $searchUsersDto->page,
    //                 maxPage: $maxPage,
    //                 users: [],
    //             );
    //             return Either::right($searchedUsersResult);
    //         }

    //         // If the requested page exceeds the max page, return an error response
    //         if ($searchUsersDto->page > $maxPage) {
    //             return Either::left([
    //                 'statusCode' => 404,
    //                 'errorMessage' => 'Page number exceeds maximum pages',
    //             ]);
    //         }

    //         // Calculate how many users to skip for pagination
    //         $skip = ($searchUsersDto->page - 1) * self::PAGE_SIZE;

    //         // Fetch paginated user data
    //         $userRecords = $query
    //             ->skip($skip)
    //             ->take(self::PAGE_SIZE)
    //             ->get();

    //         // Map user data to User entity
    //         $users = $userRecords->map(function ($userRecord): UserEntity {
    //             return new UserEntity(
    //                 id: (string) $userRecord->id,
    //                 name: $userRecord->name,
    //                 userName: $userRecord->userName,
    //                 profilePictureBlob: $userRecord->profilePictureBlob
    //             );
    //         })->toArray();

    //         $searchedUsersResult = new SearchedUsersResultDto(
    //             currentPage: $searchUsersDto->page,
    //             maxPage: $maxPage,
    //             users: $users,
    //         );

    //         return Either::right($searchedUsersResult);

    //     } catch (\Exception $e) {
    //         // Error response in case of exception
    //         return Either::left([
    //             'statusCode' => 500,
    //             'errorMessage' => 'An error occurred while searching for users: ' . $e->getMessage(),
    //         ]);
    //     }
    // }

    public function getUser(string $userId): Either
    {
        try {
            // Fetch user by ID using Eloquent
            $userRecord = User::find($userId);

            // If the user is not found, return a 404 error
            if (!$userRecord) {
                return Either::left([
                    'statusCode' => 404,
                    'errorMessage' => 'User not found',
                ]);
            }

            // Map the Eloquent user model to the UserEntity
            $user = new UserEntity(
                id: (string) $userRecord->id,
                name: $userRecord->name,
                userName: $userRecord->userName,
                profilePictureBlob: $userRecord->profilePictureBlob,
            );

            // Return the user entity wrapped in an Either::right
            return Either::right($user);

        } catch (\Exception $e) {
            // Handle any exceptions and return a 500 error
            return Either::left([
                'statusCode' => 500,
                'errorMessage' => 'An error occurred while retrieving user: ' . $e->getMessage(),
            ]);
        }
    }

    // public function getUser(string $userId): Either
    // {
    //     try {
    //         $query = DB::table('users')
    //             ->where('id', $userId) 
    //             ->first();
    
    //         if (!$query) {
    //             return Either::left([
    //                 'statusCode' => 404,
    //                 'errorMessage' => 'User not found',
    //             ]);
    //         }
    
    //         $user = new UserEntity(
    //             id: $query->id,
    //             name: $query->name,
    //             userName: $query->userName,
    //             profilePictureBlob: $query->profilePictureBlob,
    //         );
    
    //         return Either::right($user);
    
    //     } catch (\Exception $e) {
    //         return Either::left([
    //             'statusCode' => 500,
    //             'errorMessage' => 'An error occurred while getting user: ' . $e->getMessage(),
    //         ]);
    //     }
    // }
}