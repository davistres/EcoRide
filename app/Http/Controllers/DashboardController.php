<?php
namespace App\Http\Controllers;

use App\Models\Trip;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $activeTrips = Trip::where('driver_id', Auth::id())
            ->where('status', 'en cours')
            ->get();

        return view('dashboard', compact('activeTrips'));
    }
}
