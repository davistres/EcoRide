EcoRide - Plateforme de Covoiturage Écologique

EcoRide est une plateforme de covoiturage écologique permettant aux utilisateurs de trouver et proposer des trajets en voiture de manière responsable.

Fonctionnalités principales
•	Recherche de covoiturage en fonction du lieu de départ, d'arrivée et de la date.
•	Publication de trajets pour proposer un covoiturage
•	Gestion des réservations avec système de validation
•	Filtrage des trajets écologiques
•	Système de crédits pour les utilisateurs
•	Authentification et gestion des profils utilisateurs
•	Évaluation et avis sur les trajets
•	Système de préférences (fumeur, animaux, etc.)


Technologies utilisées
•	Back-end : Laravel 9 (PHP 8.0+)
•	Front-end : HTML, CSS, JavaScript (vanilla)
•	Base de données : MySQL (hébergée sur InfinityFree)
•	Déploiement : Heroku


Installation locale
1-	Prérequis
Assurez-vous d’avoir installé :
•	PHP 8.0+ et Composer
•	MySQL
•	Git
•	Heroku CLI (si vous souhaitez déployer)

2-	Cloner le projet
 git clone https://github.com/davistres/EcoRide.git
 cd EcoRide

3-	Installer les dépendances PHP et JS
composer install
npm install






4-	Configurer l’environnement
Copiez le fichier .env.example et renommez-le en .env, puis configurez la base de données :
cp .env.example .env
php artisan key:generate

5-	Modifiez le fichier .env avec vos paramètres MySQL sur InfinityFree :
DB_CONNECTION=mysql
DB_HOST=sqlXXX.infinityfree.com
DB_DATABASE=if0_xxxxxxx
DB_USERNAME=if0_xxxxxxx
DB_PASSWORD=your_db_password

6-	Exécuter les migrations et les seeds
php artisan migrate –seed


7-	Lancer le serveur local
php artisan serve
Le projet sera accessible sur http://127.0.0.1:8000



Déploiement sur Heroku
1️- Se connecter à Heroku
heroku login

2️- Ajouter le buildpack PHP
heroku buildpacks:set heroku/php -a covoit-ecoride

3️- Ajouter une base de données MySQL (InfinityFree)
Configurer les variables d’environnement Heroku :
heroku config:set DB_CONNECTION=mysql DB_HOST=sqlXXX.infinityfree.com DB_DATABASE=if0_xxxxxxx DB_USERNAME=if0_xxxxxxx DB_PASSWORD=your_db_password -a covoit-ecoride

4️- Pousser le projet sur Heroku
git add .
git commit -m "Déploiement sur Heroku"
git push heroku main

5️- Exécuter les migrations sur Heroku
heroku run php artisan migrate -a covoit-ecoride

Votre application est maintenant en ligne !




Structure du projet
EcoRide/
│── app/               # Controllers, Models, etc…
│── bootstrap/         # Initialisation Laravel
│── config/            # Fichiers de configuration
│── database/          # Migrations et seeds
│── public/            # Point d'entrée de l'application
│── resources/         # Vues, CSS, JS
│── routes/            # Définition des routes web
│── storage/           # Logs, cache et fichiers temporaires
│── tests/             # Tests unitaires et fonctionnels
│── .env               # Variables d’environnement
│── .gitignore         # Fichiers ignorés par Git
│── composer.json      # Dépendances PHP
│── package.json       # Dépendances JavaScript


Commandes utiles
Commande	Description
php artisan serve	Démarrer le serveur local
php artisan migrate --seed	Exécuter les migrations et ajouter des données initiales
php artisan tinker	Ouvrir un terminal interactif avec Laravel
git push heroku main	Déployer sur Heroku
heroku logs --tail	Voir les logs en temps réel sur Heroku

Licence
Ce projet est sous licence MIT. Vous pouvez l’utiliser librement.

Auteur
MOI !
