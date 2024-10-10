<?php

namespace Database\Seeders;

use App\Models\Code;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create weeks
        $this->call(WeekSeeder::class);

        // Create users
        User::factory(10)
            ->has(Code::factory()->consumed()->count(2))
            ->has(Code::factory()->count(3))
            ->create();
    }
}
