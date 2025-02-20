<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\ValidationException;

class CovoiturageController extends Controller
{
    public function index()
    {
        // chargement = clean
        Session::forget('covoiturages');
        Log::info("Session covoiturages vidée à l'index");

        return view('trips.index');
    }

    public function show($id)
    {
        try {
            $covoiturage = DB::table('trips')->where('id', $id)->first();

            if (! $covoiturage) {
                return redirect()->route('trips.index')
                    ->with('error', 'Ce covoiturage n\'existe pas ou n\'est plus disponible.');
            }

            return view('trips.show', compact('covoiturage', 'id'));

        } catch (\Exception $e) {
            Log::error('Erreur lors de l\'affichage du covoiturage: ' . $e->getMessage());
            return redirect()->route('trips.index')
                ->with('error', 'Une erreur est survenue lors de la récupération du covoiturage.');
        }
    }

    public function search(Request $request)
    {
        try {
            // Validation
            $validated = $request->validate([
                'lieu_depart'  => 'required|string|min:2|max:50',
                'lieu_arrivee' => 'required|string|min:2|max:50',
                'date'         => 'required|date|after_or_equal:today',
            ], [
                'lieu_depart.required'  => 'La ville de départ est obligatoire.',
                'lieu_arrivee.required' => 'La ville d\'arrivée est obligatoire.',
                'date.required'         => 'La date est obligatoire.',
                'date.after_or_equal'   => 'La date doit être aujourd\'hui ou dans le futur.',
            ]);

            $lieu_depart  = trim(strtolower($validated['lieu_depart']));
            $lieu_arrivee = trim(strtolower($validated['lieu_arrivee']));
            $date         = $validated['date'];

            // route?
            $routeExists = $this->checkRouteExists($lieu_depart, $lieu_arrivee);
            if (! $routeExists) {
                return redirect()->route('trips.index')
                    ->with('error', 'Aucune route de covoiturage n\'existe entre ces villes.')
                    ->withInput($request->only(['lieu_depart', 'lieu_arrivee', 'date']));
            }

            // Recherche
            $covoiturages = $this->findCovoituragesForDate($lieu_depart, $lieu_arrivee, $date);

            if (empty($covoiturages)) {
                return redirect()->route('trips.index')
                    ->with('error', 'Aucun covoiturage disponible entre ces villes.')
                    ->withInput($request->only(['lieu_depart', 'lieu_arrivee', 'date']));
            }

            if (! empty($covoiturages)) {
                Session::put('covoiturages', $covoiturages);
                Log::info('Covoiturages stockés en session', ['covoiturages' => $covoiturages]);

            } else {
                Log::warning('Aucun covoiturage trouvé lors de la recherche.');
            }

            return redirect()->route('trips.index')
                ->with('success', count($covoiturages) . ' covoiturage(s) trouvé(s)');

        } catch (ValidationException $e) {
            Log::error('Erreur de validation', ['errors' => $e->errors()]);
            return redirect()->back()
                ->withErrors($e->validator)
                ->withInput($request->only(['lieu_depart', 'lieu_arrivee', 'date']));
        } catch (\Exception $e) {
            Log::error('Erreur lors de la recherche', ['message' => $e->getMessage()]);
            return redirect()->route('trips.index')
                ->with('error', 'Une erreur est survenue lors de la recherche.');
        }
    }

    private function checkRouteExists($lieu_depart, $lieu_arrivee)
    {
        return DB::table('trips')
            ->whereRaw('LOWER(lieu_depart) = ?', [$lieu_depart])
            ->whereRaw('LOWER(lieu_arrivee) = ?', [$lieu_arrivee])
            ->exists();
    }

    private function findCovoituragesForDate($lieu_depart, $lieu_arrivee, $date)
    {
        try {
            // Recherche
            $covoiturages = DB::table('trips')
                ->leftJoin('users', 'trips.driver_id', '=', 'users.id')
                ->select(
                    'trips.id',
                    'users.pseudo',
                    'users.name',
                    'trips.nb_place as places_restantes',
                    'trips.prix_personne as prix',
                    DB::raw('DATE(trips.date) as date_depart'),
                    'trips.heure_depart',
                    'trips.heure_arrivee',
                    'trips.lieu_depart',
                    'trips.lieu_arrivee',
                    'trips.eco_friendly as ecologique'
                )
                ->whereRaw('LOWER(lieu_depart) = LOWER(?)', [$request->lieu_depart])
                ->whereRaw('LOWER(lieu_arrivee) = LOWER(?)', [$request->lieu_arrivee])
                ->whereDate('date', '=', $request->date)
                ->where('nb_place', '>', 0)
                ->where('statut', '=', 'en cours')
                ->orderBy('date', 'ASC')
                ->get();

            Log::info("Covoiturages trouvés : " . count($covoiturages));

            return $covoiturages;
        } catch (\Exception $e) {
            Log::error('Erreur lors de la recherche de covoiturage: ' . $e->getMessage());
            return [];
        }
    }

    public function checkSession()
    {
        $sessionData = session('covoiturages', []);

        Log::info('Vérification de session covoiturage', ['session_data' => $sessionData]);

        return response()->json([
            'hasCovoiturage' => ! empty($sessionData),
            'covoiturages'   => $sessionData, // Ajout pour debug
        ]);
    }

    private function findNextAvailableDate($lieu_depart, $lieu_arrivee, $currentDate)
    {
        try {
            $nextTrip = DB::table('trips')
                ->whereRaw('LOWER(lieu_depart) = ?', [$lieu_depart])
                ->whereRaw('LOWER(lieu_arrivee) = ?', [$lieu_arrivee])
                ->whereDate('date', '>', $currentDate)
                ->where('nb_place', '>', 0)
                ->where('statut', 'en cours')
                ->orderBy('date', 'asc')
                ->first();

            return $nextTrip ? date('Y-m-d', strtotime($nextTrip->date)) : null;
        } catch (\Exception $e) {
            Log::error('Erreur lors de la recherche de la prochaine date: ' . $e->getMessage());
            return null;
        }
    }
}
