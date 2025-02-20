@extends('layouts.app')

@section('title', 'Connexion')

@section('content')
    <main>
        <section class="login-section">
            <h2>Connexion</h2>

            @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

            <form class="login-form" method="POST" action="{{ route('login') }}" id="loginForm">
                @csrf
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required value="{{ old('email') }}">
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="search-button">Se connecter</button>
            </form>
            <p class="register-link">Pas encore de compte ? <a href="{{ route('register') }}">Créer un compte</a></p>
        </section>
    </main>
@endsection

