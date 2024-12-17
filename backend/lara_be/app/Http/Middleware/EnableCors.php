<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class EnableCors
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request);

        // Add CORS headers to the response
        if (method_exists($response, 'header')) {
            $response->header('Access-Control-Allow-Origin', '*')
                     ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                     ->header('Access-Control-Allow-Credentials', 'true')
                     ->header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization, X-Token-Auth');
        }

        return $response;
    }
}
