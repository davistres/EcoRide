<?php
    require_once __DIR__ . '/../../classes/Auth.php';

    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoRide - Covoiturage Écologique</title>
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="index.php?route=home">EcoRide</a>
            </div>
            <div class="burger" id="burger">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <ul class="nav-links">
                <li><a href="index.php?route=home">Accueil</a></li>
                <li><a href="index.php?route=covoiturage">Covoiturage</a></li>
                <li><a href="index.php?route=contact">Contact</a></li>

                <?php if (Auth::check()): ?>
                <li><span
                        class="user-pseudo"><?php echo htmlspecialchars(Auth::user()['pseudo'] ?? 'Utilisateur'); ?></span>
                </li>
                <li><a href="index.php?route=logout" class="cta-button">Déconnexion</a></li>
                <?php else: ?>
                <li><a href="index.php?route=login" class="cta-button">Connexion</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>

    <div class="mobile-menu" id="mobile-menu">
        <a href="index.php?route=home">Accueil</a>
        <a href="index.php?route=covoiturage">Covoiturage</a>
        <a href="index.php?route=contact">Contact</a>
        <?php if (! Auth::check()): ?>
        <a href="index.php?route=login">Connexion</a>
        <?php else: ?>
        <a href="index.php?route=logout">Déconnexion</a>
        <?php endif; ?>
        <div class="close-menu" id="close-menu">&times;</div>
    </div>
</body>

</html>