<?php
namespace App\Http\Controllers;

use App\Models\Trip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TripController extends Controller
{
    public function index()
    {
        $trips = Trip::where('seats_available', '>', 0)->get();
        return view('trips.index', compact('trips'));
    }

    public function create()
    {
        return view('trips.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'departure'       => 'required',
            'arrival'         => 'required',
            'date'            => 'required|date',
            'price'           => 'required|numeric',
            'seats_available' => 'required|integer|min:1',
        ]);

        Trip::create([
            'driver_id'       => Auth::id(),
            'departure'       => $request->departure,
            'arrival'         => $request->arrival,
            'date'            => $request->date,
            'price'           => $request->price,
            'seats_available' => $request->seats_available,
        ]);

        return redirect()->route('trips.index')->with('success', 'Trajet ajouté !');
    }

    public function show($id)
    {
        $trip = Trip::findOrFail($id);
        return view('trips.show', compact('trip'));
    }
}
