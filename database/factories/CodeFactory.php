<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Code>
 */
class CodeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'host_id' => User::factory(),
            'guest_id' => null,
            'code' => strtoupper(fake()->bothify("????-###-????")),
            'created_at' => now(),
            'consumed_at' => null
        ];
    }

    /**
     * Indicate that the code is consumed.
     */
    public function consumed(): Factory
    {
        return $this->state(function (array $attributes) {
            return [
                'consumed_at' => now(),
            ];
        });
    }
}
