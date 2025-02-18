@extends('layouts.app')

@section('title', 'Bienvenue sur EcoRide')

@section('content')
    <main class="home">
        <section class="hero">
            <h1>Bienvenue sur EcoRide</h1>
            <p>La plateforme de covoiturage écologique</p>
        </section>

        <section class="search-section">
            <form class="search-form">
                <div class="form-group">
                    <label for="departure">Départ</label>
                    <input type="text" id="departure" name="departure" placeholder="Ville de départ" required>
                </div>
                <div class="form-group">
                    <label for="arrival">Arrivée</label>
                    <input type="text" id="arrival" name="arrival" placeholder="Ville d'arrivée" required>
                </div>
                <div class="form-group">
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" required>
                </div>
                <button type="button" class="search-button" id="search">Rechercher un trajet</button>
            </form>
        </section>
        
        <section class="map-section">
            <div id="map" class="map"></div>
        </section>
        
        <section class="presentation">
            <div class="text-content">
                <h2>Voyagez autrement avec EcoRide</h2>
                <p>EcoRide est une startup française engagée dans la réduction de l'impact environnemental des déplacements. 
                   Notre mission est de rendre le covoiturage accessible à tous tout en préservant notre planète.</p>

                <div class="features">
                    <div class="feature">
                        <img src="{{ asset('images/ecolo.webp') }}" alt="Icône écologie">
                        <h3>Écologique</h3>
                        <p>Nous encourageons particulièrement les trajets en véhicules électriques</p>
                    </div>
                    <div class="feature">
                        <img src="{{ asset('images/econo.webp') }}" alt="Icône économie">
                        <h3>Économique</h3>
                        <p>Des trajets à prix réduits pour voyager malin</p>
                    </div>
                    <div class="feature">
                        <img src="{{ asset('images/commu.webp') }}" alt="Icône communauté">
                        <h3>Communautaire</h3>
                        <p>Rejoignez une communauté de voyageurs responsables</p>
                    </div>
                </div>
            </div>
        </section>
        <div class="image-banner">
            <img src="{{ asset('images/pexels-cottonbro-5329298.jpg') }}" alt="Covoiturage EcoRide" class="main-image">
        </div>
    </main>
@endsection
