<?php
namespace App\Infastructure\Repository;

use App\Domain\User\Entities\User;
use App\Domain\User\DTO\RegisterDto;
use App\Domain\User\DTO\SearchUsersDto;
use App\Domain\User\DTO\SearchedUsersResultDto;
use App\Domain\User\Repositories\UserRepository;
use App\Domain\Auth\Entities\ErrorResponse;
use App\Utils\Either;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UserRepositoryImpl implements UserRepository
{
    public function registerUser(RegisterDto $registerDto): Either
    {
        // check if user already exists
        $existingUser = DB::table(table: 'users')
            ->where(column: 'userName', operator: $registerDto->userName)
            ->first();

        if ($existingUser) {
            $errorResponse = new ErrorResponse(
                statusCode: 400,
                errorMessage: 'User already exists, try another username',
            );
            
            return Either::left($errorResponse);
        }

        // user hashed password
        $hashedPassword = Hash::make(value: $registerDto->password);

        DB::table(table: 'users')->insert(values: [
            'name' => $registerDto->name,
            'userName' => $registerDto->userName,
            'password' => $hashedPassword,
            'profilePictureBlob' => $registerDto->profilePictureBlob,
            // additional fields for user requests and connections data
            'requests' => json_encode([]),
            'connections' => json_encode([]),
        ]);

        return Either::right('created');
    }

    private const PAGE_SIZE = 10; // Default page size
    public function searchUsers(SearchUsersDto $searchUsersDto): Either
    {
        try {
            // Case-insensitive search for users
            $query = DB::table('users')
                ->where('userName', 'like', "%{$searchUsersDto->searchQuery}%");

            // Fetch the total count of matching users
            $totalUsers = $query->count();



            // Calculate the maximum page number
            $maxPage = ceil($totalUsers / self::PAGE_SIZE);

            // If no users found, return an error response
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

            // Fetch paginated user data
            $userRecords = $query
                ->skip($skip)
                ->take(self::PAGE_SIZE)
                ->get();

            // Map user data to User entity
            $users = $userRecords->map(function ($userRecord): User {
                return new User(
                    id: (string) $userRecord->id,
                    name: $userRecord->name,
                    userName: $userRecord->userName,
                    profilePictureBlob: $userRecord->profilePictureBlob
                );
            })->toArray();

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

    public function getUser(string $userId): Either
    {
        try {
            $query = DB::table('users')
                ->where('id', $userId) 
                ->first();
    
            if (!$query) {
                return Either::left([
                    'statusCode' => 404,
                    'errorMessage' => 'User not found',
                ]);
            }
    
            $user = new User(
                id: $query->id,
                name: $query->name,
                userName: $query->userName,
                profilePictureBlob: $query->profilePictureBlob,
            );
    
            return Either::right($user);
    
        } catch (\Exception $e) {
            return Either::left([
                'statusCode' => 500,
                'errorMessage' => 'An error occurred while getting user: ' . $e->getMessage(),
            ]);
        }
    }
}