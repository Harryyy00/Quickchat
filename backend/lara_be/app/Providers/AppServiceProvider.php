<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

/// Auth Service
use App\Domain\Auth\Repositories\AuthenticationRepository;
use App\Infastructure\Repository\AuthenticationRepositoryImpl;

/// User Service
use App\Domain\User\Repositories\UserRepository;
use App\Infastructure\Repository\UserRepositoryImpl;

/// Chat Service
use App\Domain\Chat\Repositories\ChatRepository;
use App\Infastructure\Repository\ChatRepositoryImpl;



class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // Binding Repository to its implementation
        $this->app->bind(abstract: AuthenticationRepository::class, concrete: AuthenticationRepositoryImpl::class);
        $this->app->bind(abstract: UserRepository::class, concrete: UserRepositoryImpl::class);
        $this->app->bind(abstract: ChatRepository::class, concrete: ChatRepositoryImpl::class);
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
