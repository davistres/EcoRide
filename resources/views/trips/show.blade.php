@extends('layouts.app')

@section('title', 'Détails du covoiturage')

@section('content')
    <main class="covoiturage-details-container">
        <div class="breadcrumb">
            <a href="{{ route('trips.index') }}">Retour aux covoiturages</a>
        </div>
        
        <h1 class="details-title">Détails du covoiturage #{{ $id }}</h1>
        
        <div class="details-content">
            <p>Cette page est en cours de développement.</p>
            <p>Les détails complets de ce covoiturage seront bientôt disponibles.</p>
        </div>
    </main>
@endsection