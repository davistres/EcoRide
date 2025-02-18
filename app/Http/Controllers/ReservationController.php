<?php
namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\Trip;
use Illuminate\Support\Facades\Auth;

class ReservationController extends Controller
{
    public function reserve($id)
    {
        $trip = Trip::findOrFail($id);

        if ($trip->seats_available > 0) {
            Reservation::create([
                'user_id' => Auth::id(),
                'trip_id' => $trip->id,
                'status'  => 'pending',
            ]);

            $trip->decrement('seats_available');

            return redirect()->route('reservations.index')->with('success', 'Réservation confirmée !');
        }

        return back()->withErrors(['error' => 'Plus de places disponibles.']);
    }

    public function index()
    {
        $reservations = Reservation::where('user_id', Auth::id())->get();
        return view('reservations.index', compact('reservations'));
    }
}
