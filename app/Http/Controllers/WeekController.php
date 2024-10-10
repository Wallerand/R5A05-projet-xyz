<?php

namespace App\Http\Controllers;

use App\Models\Week;

class WeekController extends Controller
{
    /**
     * Redirect to current week.
     */
    public function index()
    {
        return redirect()->route('weeks.show', [
            'week' => Week::current()
        ]);
    }

    /**
     * Show the given week.
     */
    public function show(Week $week)
    {
        return view('app.weeks.show', [
            'week' => $week,
            'tracks' => [],
            'isCurrent' => $week->toPeriod()->contains(now()),
        ]);
    }
}
