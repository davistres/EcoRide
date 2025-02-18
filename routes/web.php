<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\MapController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\TripController;
use Illuminate\Support\Facades\Route;

/*ROUTE*/
Route::get('/', function () {
    return view('home');
})->name('home');

Route::get('/contact', function () {
    return view('contact');
})->name('contact');

Route::post('/contact', [ContactController::class, 'store'])->name('contact.store');

Route::get('/covoiturage', [TripController::class, 'index'])->name('trips.index');

Route::get('/mentions-legales', function () {
    return view('mentions');
})->name('mentions-legales');

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::get('/api/coordinates/{city}', [MapController::class, 'getCoordinates']);
Route::get('/api/route', [MapController::class, 'getRoute']);
Route::get('/test-session', [ContactController::class, 'testSession']);
Route::get('/test-session', function () {
    session(['test' => 'Session fonctionne !']);
    return session('test');
});
Route::get('/check-session', function () {
    return session()->all();
});

/*middleware*/
Route::middleware(['auth'])->group(function () {

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/trips/create', [TripController::class, 'create'])->name('trips.create');
    Route::post('/trips', [TripController::class, 'store'])->name('trips.store');
    Route::get('/trips/{id}', [TripController::class, 'show'])->name('trips.show');
    Route::post('/trips/{id}/reserve', [ReservationController::class, 'reserve'])->name('trips.reserve');
    Route::get('/reservations', [ReservationController::class, 'index'])->name('reservations.index');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

/*fallback*/
Route::fallback(function () {
    return view('404');
});

require __DIR__ . '/auth.php';
require base_path('routes/api.php');
