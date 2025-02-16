<?php
require_once '../classes/Database.php';
require_once '../classes/User.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    error_log('Données reçues : ' . print_r($_POST, true));
    {

        if (empty($_POST['pseudo']) || empty($_POST['email']) || empty($_POST['password'])) {
            echo json_encode([
                'success' => false,
                'message' => 'Tous les champs sont obligatoires',
            ]);
            exit;
        }
    }

    if (! filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        echo json_encode([
            'success' => false,
            'message' => 'Format d\'email invalide',
        ]);
        exit;
    }

    if (strlen($_POST['password']) < 8) {
        echo json_encode([
            'success' => false,
            'message' => 'Le mot de passe doit faire au moins 8 caractères',
        ]);
        exit;
    }

    $data = [
        'pseudo'   => htmlspecialchars(trim($_POST['pseudo'])),
        'email'    => filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL),
        'password' => $_POST['password'],
        'nom'      => ! empty($_POST['nom']) ? htmlspecialchars(trim($_POST['nom'])) : null,
        'prenom'   => ! empty($_POST['prenom']) ? htmlspecialchars(trim($_POST['prenom'])) : null,
    ];

    try {
        $user   = new User();
        $result = $user->register($data);
        echo json_encode($result);
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Une erreur est survenue lors de l\'inscription',
        ]);
    }
    exit;
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Méthode non autorisée',
    ]);
    exit;
}