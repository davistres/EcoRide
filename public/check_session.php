<?php
session_start();
header('Content-Type: application/json');

$response = [
    "hasCovoiturage" => isset($_SESSION['covoiturages']) && count($_SESSION['covoiturages']) > 0,
];

echo json_encode($response);
