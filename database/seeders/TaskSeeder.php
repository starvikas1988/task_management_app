<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Task;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TaskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Task::factory(10)->create();
    }
}
