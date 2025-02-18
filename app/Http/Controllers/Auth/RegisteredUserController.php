<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RegisteredUserController extends Controller
{

    public function create()
    {
        return view('auth.register');
    }

    /*demande d'inscription*/
    public function store(Request $request)
    {
        try {
            DB::connection()->getPdo();
        } catch (\Exception $e) {
            return redirect()->route('register')->with('error', "❌ Erreur de connexion à la base : " . $e->getMessage());
        }

        $validatedData = $request->validate([
            'pseudo'   => ['required', 'string', 'max:255'],
            'email'    => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', 'min:8'],
        ]);

        try {
            DB::beginTransaction();

            $user = User::create([
                'name'     => $validatedData['pseudo'],
                'email'    => $validatedData['email'],
                'password' => Hash::make($validatedData['password']),
            ]);

            DB::commit();

            if (! $user) {
                throw new \Exception("L'utilisateur n'a pas été créé !");
            }

            Auth::login($user);

            return redirect()->route('dashboard')->with('success', 'Inscription réussie !');

        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('register')->with('error', "❌ Erreur lors de l'inscription : " . $e->getMessage());
        }
    }
}
