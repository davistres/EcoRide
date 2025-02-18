@extends('layouts.app')

@section('title', 'Tableau de bord - EcoRide')

@section('content')
    <main class="dashboard">

        <section class="dashboard-header">
            <h1>Bienvenue, {{ Auth::user()->pseudo ?? 'Utilisateur' }}</h1>
            <p>Email : {{ Auth::user()->email }}</p>
            <div class="credit-balance">
                <p>Crédit disponible : <strong>{{ Auth::user()->credits ?? 0 }} crédits</strong></p>
            </div>
        </section>

        <section class="user-status">
            <h2>Votre statut :</h2>
            @if(Auth::user()->is_driver && Auth::user()->is_passenger)
                <p>Vous êtes <strong>chauffeur et passager</strong>.</p>
            @elseif(Auth::user()->is_driver)
                <p>Vous êtes <strong>chauffeur</strong>.</p>
            @elseif(Auth::user()->is_passenger)
                <p>Vous êtes <strong>passager</strong>.</p>
            @else
                <p>Vous n'avez pas encore défini votre statut.</p>
            @endif
        </section>

       
        <section class="dashboard-actions">
            <h2>Actions rapides</h2>
            <div class="actions-grid">
                <a href="{{ route('trips.index') }}" class="btn">Voir les covoiturages</a>
                @if(Auth::user()->is_driver)
                    <a href="{{ route('trips.create') }}" class="btn">Proposer un trajet</a>
                    <a href="{{ route('profile.edit') }}" class="btn">Ajouter un véhicule</a>
                @endif
            </div>
        </section>

      
        <section class="current-trips">
            <h2>Vos trajets en cours</h2>
            @if(isset($activeTrips) && $activeTrips->isNotEmpty())
                <ul>
                    @foreach($activeTrips as $trip)
                        <li>
                            <strong>{{ $trip->departure }} ➝ {{ $trip->arrival }}</strong> 
                            <span>{{ $trip->date->format('d/m/Y') }} | {{ $trip->date->format('H:i') }}</span>
                            <a href="{{ route('trips.show', $trip->id) }}" class="btn">Détails</a>
                        </li>
                    @endforeach
                </ul>
            @else
                <p>Aucun trajet en cours.</p>
            @endif
        </section>

     
        <section class="trip-history">
            <h2>Historique des covoiturages</h2>
            @if(isset($pastTrips) && $pastTrips->isNotEmpty())
                <ul>
                    @foreach($pastTrips as $trip)
                        <li>
                            <strong>{{ $trip->departure }} ➝ {{ $trip->arrival }}</strong> 
                            <span>{{ $trip->date->format('d/m/Y') }} | {{ $trip->car->model ?? 'Véhicule inconnu' }}</span>
                        </li>
                    @endforeach
                </ul>
            @else
                <p>Aucun trajet passé.</p>
            @endif
        </section>
    </main>
@endsection
