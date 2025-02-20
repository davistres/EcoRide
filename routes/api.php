<?php
use App\Http\Controllers\MapController;
use Illuminate\Support\Facades\Route;

Route::prefix('api')->group(function () {
    Route::get('/coordinates/{city}', [MapController::class, 'getCoordinates']);
    Route::get('/route', [MapController::class, 'getRoute']);
});
