<?php

namespace App\Providers;

use Illuminate\View\View;
use Illuminate\Support\Facades;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Inject week param to navigation (go back to listing from tracks.show view)
        Facades\View::composer('components.navigation', fn (View $view) => $view->with([
            'week' => request()->week
        ]));
    }
}
