<?php

namespace App\Services;

use Carbon\CarbonPeriod;
use Carbon\CarbonImmutable;
use Carbon\CarbonInterface;
use Carbon\CarbonPeriodImmutable;
use Illuminate\Support\Collection;

class WeekService
{
    /**
     * Get $previousCount weeks from now.
     */
    public function previous(int $previousCount): Collection
    {
        $today = CarbonImmutable::now();
        $weeks = $today->subWeeks($previousCount)->weeksUntil($today);

        return $this->asWeekPeriod($weeks);
    }

    /**
     * Get $previousCount weeks from now until $date.
     */
    public function previousUntil(int $previousCount, CarbonInterface $date): Collection
    {
        $weeks = CarbonImmutable::now()->subWeeks($previousCount)->weeksUntil($date);

        return $this->asWeekPeriod($weeks);
    }

    /**
     * Convert a whole $weeks period into separate, immutable, week period.
     */
    private function asWeekPeriod(CarbonPeriod $weeks): Collection
    {
        return collect($weeks)->map(fn ($week) => new CarbonPeriodImmutable(
            $week->startOfWeek(),
            '1 day',
            $week->endOfWeek()
        ));
    }
}
