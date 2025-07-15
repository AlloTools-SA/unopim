<?php

namespace App\Providers;

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\ParallelTesting;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use Illuminate\Routing\UrlGenerator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     */
    public function boot(UrlGenerator $url): void
    {
        Schema::defaultStringLength(191);

        ParallelTesting::setUpTestDatabase(function (string $database, int $token) {
            Artisan::call('db:seed');
        });

        if(env('APP_ENV') === 'production') {
            $url->forceScheme('https');
        }
    }

    /**
     * Register any application services.
     */
    public function register(): void {}
}
