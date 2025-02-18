@extends('layouts.app')

@section('title', 'Créer un compte')

@section('content')
    <main>
        <section class="login-section">
            <h2>Créer un compte</h2>
            <p>* champs obligatoire</p>
            <div class="credits-info">
                <p>Vous recevrez 20 crédits à la création de votre compte !</p>
            </div>
            <form class="login-form" method="POST" action="{{ route('register') }}" id="registerForm">
                @csrf
                <div class="form-group">
                    <label for="pseudo">Pseudo *</label>
                    <input type="text" id="pseudo" name="pseudo" required autocomplete="username" value="{{ old('pseudo') }}">
                </div>
                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" required autocomplete="email" value="{{ old('email') }}">
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe *</label>
                    <input type="password" id="password" name="password" required
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                        title="Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial"
                        autocomplete="new-password">
                    <div class="password-requirements">
                        <p>Le mot de passe doit contenir au minimum :</p>
                        <ul>
                            <li>8 caractères</li>
                            <li>1 majuscule</li>
                            <li>1 minuscule</li>
                            <li>1 chiffre</li>
                            <li>1 caractère spécial (@$!%*?&)</li>
                        </ul>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password_confirmation">Confirmer le mot de passe *</label>
                    <input type="password" id="password_confirmation" name="password_confirmation" required autocomplete="new-password">
                </div>
                <button type="submit" class="search-button">Créer mon compte</button>
            </form>
            <p class="register-link">Déjà inscrit ? <a href="{{ route('login') }}">Se connecter</a></p>
        </section>
    </main>

@endsection


    
