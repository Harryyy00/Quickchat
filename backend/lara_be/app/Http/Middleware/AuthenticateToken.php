<?php

namespace App\Http\Middleware;

use Closure;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Exception;
use Illuminate\Http\Request;

class AuthenticateToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next): mixed
    {
        $authHeader = $request->header(key: 'Authorization');
        $token = $this->getBearerToken(authHeader: $authHeader);

        if (!$token) {
            return response()->json(data: ['data' => ['message' => 'Unauthorized']], status: 401);
        }

        try {
            // Decode the token
            $decoded = JWT::decode(jwt: $token, keyOrKeyArray: new Key(keyMaterial: env(key: 'JWT_SECRET'), algorithm: 'HS256'));

            // Set user information in the request
            $request->attributes->set(key: 'user', value: $decoded);

            // Proceed to the next middleware/controller action
            return $next($request);
        } catch (Exception $e) {
            return response()->json(data: ['message' => 'Token is Invalid or Expired', 'error' => $e->getMessage()], status: 403);
        }
    }

    /**
     * Get the token from the Authorization header.
     *
     * @param string|null $authHeader
     * @return string|null
     */
    private function getBearerToken(?string $authHeader): ?string
    {
        if ($authHeader && preg_match(pattern: '/Bearer\s(\S+)/', subject: $authHeader, matches: $matches)) {
            return $matches[1];
        }
        return null;
    }
}
