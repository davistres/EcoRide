<?php include 'header.php'; ?>

<main>
    <section class="login-section">
        <h2>Créer un compte</h2>
        <div class="credits-info">
            <p>Vous recevrez 20 crédits à la création de votre compte !</p>
        </div>
        <form class="login-form">
            <div class="form-group">
                <label for="pseudo">Pseudo</label>
                <input type="text" id="pseudo" name="pseudo" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" required
                    pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                    title="Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial">
                <small class="password-info">Le mot de passe doit contenir au moins 8 caractères, une majuscule, une
                    minuscule, un chiffre et un caractère spécial</small>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirmer le mot de passe</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>
            <button type="submit" class="search-button">Créer mon compte</button>
        </form>
        <p class="register-link">Déjà inscrit ? <a href="index.php?route=login">Se connecter</a></p>
    </section>
</main>

<?php include 'footer.php'; ?>