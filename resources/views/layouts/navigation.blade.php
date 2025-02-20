<header>
    <nav class="navbar">
        <div class="logo">
            <a href="{{ route('home') }}">EcoRide</a>
        </div>
        <div class="burger" id="burger">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <ul class="nav-links">
            <li><a href="{{ route('home') }}">Accueil</a></li>
            <li><a href="{{ route('trips.index') }}">Covoiturage</a></li>
            <li><a href="{{ route('contact') }}">Contact</a></li>

            @auth
                <li>
                    <a href="{{ route('dashboard') }}" class="user-nom">
                        {{ Auth::user()->nom ?? 'Utilisateur' }}
                    </a>
                </li>
                <li>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="cta-button">Déconnexion</button>
                    </form>
                </li>
            @else
                <li><a href="{{ route('login') }}" class="cta-button">Connexion</a></li>
            @endauth
        </ul>
    </nav>

    <div class="mobile-menu" id="mobile-menu">
        <a href="{{ route('home') }}">Accueil</a>
        <a href="{{ route('trips.index') }}">Covoiturage</a>
        <a href="{{ route('contact') }}">Contact</a>

        @auth
            <a href="{{ route('dashboard') }}" class="user-nom">
                {{ Auth::user()->nom ?? 'Utilisateur' }}
            </a>
            <a href="{{ route('logout') }}"
               onclick="event.preventDefault(); document.getElementById('logout-form-mobile').submit();">
                Déconnexion
            </a>
            <form id="logout-form-mobile" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        @else
            <a href="{{ route('login') }}">Connexion</a>
        @endauth

        <div class="close-menu" id="close-menu">&times;</div>
    </div>
</header>