<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

header('Content-Type: application/json');

require_once __DIR__ . '/../config/config.php';

$apiKey = API_KEY;
$start  = isset($_GET['start']) ? $_GET['start'] : null;
$end    = isset($_GET['end']) ? $_GET['end'] : null;

if (! $start || ! $end) {
    echo json_encode(["error" => "Coordonnées manquantes"]);
    exit;
}

$url = "https://api.openrouteservice.org/v2/directions/driving-car/geojson";

$postData = json_encode([
    "coordinates" => [
        array_map('floatval', explode(',', $start)),
        array_map('floatval', explode(',', $end)),
    ],
]);

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Authorization: ' . $apiKey,
]);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

$response  = curl_exec($ch);
$httpCode  = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);

curl_close($ch);

if ($httpCode !== 200) {
    echo json_encode([
        "error"      => "Erreur OpenRouteService",
        "code"       => $httpCode,
        "curl_error" => $curlError,
        "response"   => json_decode($response, true),
    ]);
    exit;
}

echo $response;