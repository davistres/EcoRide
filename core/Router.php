<?php
require_once __DIR__ . '/../classes/Auth.php';

class Router
{
    private $routes;

    private $protectedRoutes = [
        'covoiturage',
    ];

    private $guestRoutes = [
        'login',
        'register',
    ];

    public function __construct()
    {
        $this->routes = require __DIR__ . '/routes.php';
    }

    public function handleRequest()
    {
        $route = $_GET['route'] ?? 'home';

        if (! array_key_exists($route, $this->routes)) {
            http_response_code(404);
            require __DIR__ . '/../views/404.php';
            return;
        }

        if (in_array($route, $this->protectedRoutes)) {
            Auth::requireAuth();
        }

        if (in_array($route, $this->guestRoutes)) {
            Auth::requireGuest();
        }

        require __DIR__ . '/../views/' . $this->routes[$route] . '.php';
    }
}