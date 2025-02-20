<?php
require_once 'Database.php'; // Connexion PDO via ta classe singleton

session_start();

// Verif soumission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $lieu_depart  = trim($_POST['lieu_depart'] ?? '');
    $lieu_arrivee = trim($_POST['lieu_arrivee'] ?? '');
    $date         = trim($_POST['date'] ?? '');

    if (empty($lieu_depart) || empty($lieu_arrivee) || empty($date)) {
        header("Location: home.blade.php?error=Veuillez remplir tous les champs");
        exit;
    }

    $pdo = Database::getInstance()->getConnection();

    // covoit + places dispo
    $sql = "SELECT * FROM trips
            WHERE lieu_depart = :lieu_depart
            AND lieu_arrivee = :lieu_arrivee
            AND DATE(date) = :date
            AND nb_place > 0
            ORDER BY date ASC";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':lieu_depart'  => $lieu_depart,
        ':lieu_arrivee' => $lieu_arrivee,
        ':date'         => $date,
    ]);

    $covoiturages = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // prochaine date dispo
    if (empty($covoiturages)) {
        $sql = "SELECT date FROM trips
                WHERE lieu_depart = :lieu_depart
                AND lieu_arrivee = :lieu_arrivee
                AND nb_place > 0
                ORDER BY date ASC
                LIMIT 1";

        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':lieu_depart'  => $lieu_depart,
            ':lieu_arrivee' => $lieu_arrivee,
        ]);

        $nextTrip = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($nextTrip) {
            header("Location: home.blade.php?suggested_date=" . $nextTrip['date']);
        } else {
            header("Location: home.blade.php?error=Aucun covoiturage disponible");
        }
        exit;
    }

    $_SESSION['covoiturages'] = $covoiturages;
    header("Location: trips/index.blade.php");
    exit;
}
