<?php include __DIR__ . '/layouts/header.php'; ?>

<main>
    <section class="login-section">
        <h2>Connexion</h2>
        <form class="login-form" method="POST" id="loginForm">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="search-button">Se connecter</button>
        </form>
        <p class="register-link">Pas encore de compte ? <a href="index.php?route=register">Créer un compte</a>
        </p>
    </section>
</main>

<?php include __DIR__ . '/layouts/footer.php'; ?>