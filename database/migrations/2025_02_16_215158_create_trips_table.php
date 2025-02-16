<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('trips', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('driver_id');         // Référence à l'utilisateur qui crée le trajet
            $table->string('departure');                     // Ville de départ
            $table->string('arrival');                       // Ville d'arrivée
            $table->dateTime('date');                        // Date et heure du départ
            $table->decimal('price', 8, 2);                  // Prix du trajet
            $table->integer('seats_available');              // Nombre de places disponibles
            $table->boolean('eco_friendly')->default(false); // Si c'est un trajet écologique (voiture électrique)
            $table->timestamps();                            // Ajoute created_at et updated_at automatiquement

            // Clé étrangère pour relier le trajet à un utilisateur (chauffeur)
            $table->foreign('driver_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trips');
    }
};