<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::middleware('auth')->post('/generate-token', [TaskController::class, 'generateToken']);


// Route::middleware('auth:sanctum')->group(function () {
//     Route::get('/tasks', [TaskController::class, 'index'])->name('api.tasks.index');
//     Route::post('/tasks', [TaskController::class, 'store'])->name('api.tasks.store');
//     Route::get('/tasks/{task}', [TaskController::class, 'show'])->name('api.tasks.show');
//     Route::put('/tasks/{task}', [TaskController::class, 'update'])->name('api.tasks.update');
//     Route::delete('/tasks/{task}', [TaskController::class, 'destroy'])->name('api.tasks.destroy');
// });



Route::middleware('auth:sanctum')->group(function () {
     Route::apiResource('tasks', TaskController::class);

    Route::get('/user', function (Request $request) {
    return $request->user();
});
});

// Route::apiResource('tasks', TaskController::class);

