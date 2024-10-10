<?php

namespace Database\Factories;

use Carbon\Unit;
use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Track>
 */
class WeekFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $week = now()->set(Unit::Week, rand(1, 52))->startOfWeek();

        return [
            'year' => $week->get('year'),
            'week_number' => $week->get('week'),
            'week_starts_at' => $week->startOfWeek(),
            'week_ends_at' => $week->endOfWeek(),
        ];
    }

    /**
     * Get current week.
     */
    public function current()
    {
        $week = CarbonImmutable::now()->startOfWeek();

        return $this->state(fn ($attributes) => [
            'year' => $week->get('year'),
            'week_number' => $week->get('week'),
            'week_starts_at' => $week->startOfWeek(),
            'week_ends_at' => $week->endOfWeek(),
        ]); 
    }
}
