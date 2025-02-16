<?php
require_once __DIR__ . '/../classes/Auth.php';

session_start();
Auth::logout();

header("Location: index.php?route=login");
exit;