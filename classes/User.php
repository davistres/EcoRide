<?php
class User
{
    private $db;

    public function __construct()
    {
        $this->db = Database::getInstance()->getConnection();
    }

    public function register($data)
    {
        try {
            error_log('Tentative d\'inscription : ' . print_r($data, true));

            $check = $this->db->prepare("SELECT email FROM utilisateur WHERE email = ?");
            $check->execute([$data['email']]);
            if ($check->rowCount() > 0) {
                return [
                    'success' => false,
                    'message' => 'Cet email est déjà utilisé',
                ];
            }

            $hashedPassword = password_hash($data['password'], PASSWORD_DEFAULT);

            $sql  = "INSERT INTO utilisateur (pseudo, email, password) VALUES (?, ?, ?)";
            $stmt = $this->db->prepare($sql);

            $stmt->execute([
                $data['pseudo'],
                $data['email'],
                $hashedPassword,
            ]);

            return [
                'success' => true,
                'message' => 'Compte créé avec succès',
            ];
        } catch (PDOException $e) {
            error_log('Erreur SQL : ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Erreur lors de l\'inscription',
            ];
        }
    }

    public function login($email, $password)
    {
        try {

            $stmt = $this->db->prepare("SELECT id, email, password FROM utilisateur WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['password'])) {
                session_start();
                $_SESSION['user_id']    = $user['id'];
                $_SESSION['user_email'] = $user['email'];

                return [
                    'success' => true,
                    'message' => 'Connexion réussie',
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Identifiants incorrects',
                ];
            }
        } catch (PDOException $e) {
            error_log('Erreur SQL : ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Erreur lors de la connexion',
            ];
        }
    }

    public function isLoggedIn()
    {
        return isset($_SESSION['user_id']);
    }

    public function logout()
    {
        session_start();
        session_destroy();
        header("Location: index.php?route=login");
        exit;
    }
}