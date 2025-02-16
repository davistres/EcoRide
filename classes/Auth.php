<?php

class Auth
{

    private static function startSession()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    public static function check()
    {
        self::startSession();
        return isset($_SESSION['user_id']);
    }

    public static function user()
    {
        self::startSession();
        if (self::check()) {
            return [
                'id'     => $_SESSION['user_id'],
                'pseudo' => $_SESSION['pseudo'] ?? null,
                'email'  => $_SESSION['user_email'] ?? null,
            ];
        }
        return null;
    }

    public static function logout()
    {
        self::startSession();

        $_SESSION = [];

        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }

        session_destroy();

        header('Location: index.php?route=login');
        exit;
    }

    public static function requireAuth()
    {
        if (! self::check()) {
            header('Location: index.php?route=login');
            exit;
        }
    }

    public static function requireGuest()
    {
        if (self::check()) {
            header('Location: index.php?route=home');
            exit;
        }
    }

    public static function regenerateSession()
    {
        self::startSession();
        session_regenerate_id(true);
    }

    public static function loginUser($email, $password)
    {
        self::startSession();
        $db  = Database::getInstance();
        $pdo = $db->getConnection();

        $stmt = $pdo->prepare("SELECT id, email, pseudo, password FROM utilisateur WHERE email = :email");
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {

            $_SESSION['user_id']    = $user['id'];
            $_SESSION['user_email'] = $user['email'];
            $_SESSION['pseudo']     = $user['pseudo'];

            self::regenerateSession();

            return ["success" => true, "message" => "Connexion réussie"];
        } else {
            return ["success" => false, "message" => "Identifiants incorrects"];
        }
    }
}