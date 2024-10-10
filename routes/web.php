<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\WeekController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RegisterController;

Route::group(['middleware' => ['guest']], function () {
    // Login
    Route::get('/login', [LoginController::class, 'show'])->name('login');
    Route::post('/login', [LoginController::class, 'authenticate'])->name('authenticate');

    // Signup
    Route::get('/signup/terms', [RegisterController::class, 'terms'])->name('terms');
    Route::get('/signup/account', [RegisterController::class, 'account'])->name('account');
    Route::post('/signup/account', [RegisterController::class, 'register'])->name('register');
});

Route::group(['middleware' => ['auth']], function () {
    Route::get('/', HomeController::class)->name('home');
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    // Week ranking
    Route::get('/weeks', [WeekController::class, 'index'])->name('weeks.index'); // Redirect to current week
    Route::get('/weeks/{week:uri}', [WeekController::class, 'show'])->name('weeks.show')->where('week', '[0-9]{4}/[0-9]{2}');

    // ...

    // Profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
});
