@extends('layouts.app')

@section('title', 'Liste des trajets')

@section('content')
    <h1 class="home">Liste des trajets disponibles</h1>
    @if ($trips->isEmpty())
        <p>Aucun trajet disponible pour le moment.</p>
    @else
        <ul>
            @foreach ($trips as $trip)
                <li>{{ $trip->departure }} → {{ $trip->arrival }} - {{ $trip->seats_available }} places disponibles</li>
            @endforeach
        </ul>
    @endif
@endsection
