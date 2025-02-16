<?php
require_once '../classes/Database.php';
require_once '../classes/User.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (empty($_POST['email']) || empty($_POST['password'])) {
        echo json_encode([
            'success' => false,
            'message' => 'Email et mot de passe requis',
        ]);
        exit;
    }

    $email    = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];

    if (! filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode([
            'success' => false,
            'message' => 'Format d\'email invalide',
        ]);
        exit;
    }

    try {
        $user   = new User();
        $result = $user->login($email, $password);
        echo json_encode($result);
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Une erreur est survenue lors de la connexion',
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