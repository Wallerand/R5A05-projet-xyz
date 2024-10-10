<?php

namespace App\Http\Controllers;

use App\Models\Week;

class HomeController extends Controller
{
    /**
     * Show app homepage.
     */
    public function __invoke()
    {
        return view('app.home', [
            'week' => Week::current(),
            'tracks' => [],
            'weeks' => Week::last(5)->latest('week_starts_at')->get(),
        ]);
    }
}
