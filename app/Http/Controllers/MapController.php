<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class MapController extends Controller
{
    /* coordonnées via OpenStreetMap */
    public function getCoordinates($city)
    {
        try {
            $response = Http::withHeaders([
                'User-Agent' => 'EcoRideApp/1.0 (contact@ecoride.fr)',
            ])->get("https://nominatim.openstreetmap.org/search", [
                'format' => 'json',
                'q'      => $city,
                'limit'  => 1,
            ]);

            if (! $response->successful()) {
                return response()->json([
                    'error'  => 'Échec de la requête vers OpenStreetMap',
                    'status' => $response->status(),
                    'body'   => $response->body(),
                ], $response->status());
            }

            $data = $response->json();
            if (empty($data)) {
                return response()->json(['error' => 'Ville non trouvée'], 404);
            }

            return response()->json([
                'lat'          => $data[0]['lat'],
                'lon'          => $data[0]['lon'],
                'display_name' => $data[0]['display_name'],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error'   => 'Exception attrapée',
                'message' => $e->getMessage(),
                'line'    => $e->getLine(),
                'file'    => $e->getFile(),
            ], 500);
        }
    }

    /*Calcule itinéraire*/
    public function getRoute(Request $request)
    {
        try {
            $start = $request->query('start');
            $end   = $request->query('end');

            if (! $start || ! $end) {
                return response()->json(['error' => 'Les paramètres start et end sont requis.'], 400);
            }

            if (! preg_match('/^-?\d+(\.\d+)?,-?\d+(\.\d+)?$/', $start) ||
                ! preg_match('/^-?\d+(\.\d+)?,-?\d+(\.\d+)?$/', $end)) {
                return response()->json(['error' => 'Format de coordonnées invalide.'], 400);
            }

            $apiKey = env('OPENROUTESERVICE_API_KEY', '5b3ce3597851110001cf62480155ea5d974f4ad8a6a99971a6474824');

            $url = "https://api.openrouteservice.org/v2/directions/driving-car?api_key={$apiKey}&start={$start}&end={$end}";

            $response = Http::withOptions(['verify' => false])->get($url);

            if (! $response->successful()) {
                return response()->json([
                    'error'  => 'Impossible de récupérer l\'itinéraire',
                    'status' => $response->status(),
                    'body'   => $response->body(),
                ], $response->status());
            }

            return response()->json($response->json());
        } catch (\Exception $e) {
            return response()->json([
                'error'   => 'Erreur lors du calcul de l\'itinéraire',
                'message' => $e->getMessage(),
                'line'    => $e->getLine(),
                'file'    => $e->getFile(),
            ], 500);
        }
    }
}
