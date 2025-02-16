<?php include __DIR__ . '/layouts/header.php'; ?>

<main>
    <section class="login-section">
        <h2>Créer un compte</h2>
        <div class="credits-info">
            <p>Vous recevrez 20 crédits à la création de votre compte !</p>
        </div>
        <form class="register-form" method="POST" id="registerForm">
            <div class="form-group">
                <label for="pseudo">Pseudo</label>
                <input type="text" id="pseudo" name="pseudo" required autocomplete="username">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required autocomplete="email">
            </div>
            <div class="form-group">
                <label for="password">Mot de passe</label>
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
                <label for="confirm-password">Confirmer le mot de passe</label>
                <input type="password" id="confirm-password" name="confirm-password" required
                    autocomplete="new-password">
            </div>
            <button type="submit" class="search-button">Créer mon compte</button>
        </form>
        <p class="register-link">Déjà inscrit ? <a href="index.php?route=login">Se connecter</a></p>
    </section>
</main>

<?php include __DIR__ . '/layouts/footer.php'; ?>