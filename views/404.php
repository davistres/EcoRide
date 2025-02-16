<?php
http_response_code(404);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoRide - Page non trouvée</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body class="body404">
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
                <li><a href="index.php?route=login" class="cta-button">Connexion</a></li>
            </ul>
        </nav>
    </header>

    <div class="mobile-menu" id="mobile-menu">
        <a href="index.php?route=home">Accueil</a>
        <a href="index.php?route=covoiturage">Covoiturage</a>
        <a href="index.php?route=contact">Contact</a>
        <a href="index.php?route=login">Connexion</a>
        <div class="close-menu" id="close-menu">&times;</div>
    </div>

    <main class="main404">
        <section class="hero">
            <h1>404 - Page non trouvée</h1>
            <p>La page que vous recherchez n'existe pas.</p>
            <a href="index.php?route=home" class="btn404">Retour à l'accueil</a>
        </section>
    </main>

    <?php include __DIR__ . '/layouts/footer.php'; ?>