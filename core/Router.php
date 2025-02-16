<?php
class Router {
    private $routes;

    public function __construct() {
        $this->routes = require __DIR__ . '/routes.php';
    }

    public function handleRequest() {
        $route = $_GET['route'] ?? 'home';
        if (array_key_exists($route, $this->routes)) {
            require __DIR__ . '/../views/' . $this->routes[$route]  . '.php';
        } else {
            require __DIR__ . '/../views/404.php';
        }
    }
}
?>