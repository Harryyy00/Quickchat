<?
namespace App\Http\Controllers;

use App\Domain\Auth\DTO\LoginDto;
use App\Domain\Auth\Services\LoginUserService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller
{
    private LoginUserService $loginService;

    public function __construct(LoginUserService $loginService)
    {
        $this->loginService = $loginService;
    }

    public function login(Request $request): JsonResponse
    {
        $loginDto = new LoginDto(
            userName: $request->input('userName'),
            password: $request->input('password'),
        );
        $result = $this->loginService->execute($loginDto);

        if ($result->isRight()) {
            return response()->json(data: ['data' => $result->unwrap()], status: 200);
        }

        return response()->json(data: ['errors' => $result->unwrap()], status: 400);
    }
}
