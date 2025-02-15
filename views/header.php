<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoRide - Covoiturage Écologique</title>
    <link rel="stylesheet" href="styles.css">
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