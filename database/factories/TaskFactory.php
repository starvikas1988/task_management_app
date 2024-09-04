<?php

namespace Database\Factories;

use App\Models\User;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Task>
 */
class TaskFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'user_id' => User::factory(),
            'title'   => $this->faker->sentence,
            'description' => $this->faker->paragraph,
            'due_date'    => $this->faker->dateTimeBetween('-1 month', '+1 month')->format('Y-m-d'),
            'priority' => $this->faker->randomElement(['Low', 'Medium', 'High']),
            'status' => $this->faker->randomElement(['Completed', 'Incomplete']),
        ];
    }
}
