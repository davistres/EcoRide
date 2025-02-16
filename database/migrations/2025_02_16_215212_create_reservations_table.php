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
        Schema::create('reservations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');                                            // ID de l'utilisateur qui réserve
            $table->unsignedBigInteger('trip_id');                                            // ID du trajet réservé
            $table->enum('status', ['pending', 'confirmed', 'canceled'])->default('pending'); // Statut de la réservation
            $table->timestamps();                                                             // Ajoute created_at et updated_at automatiquement

            // Clé étrangère reliant la réservation à un utilisateur
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            // Clé étrangère reliant la réservation à un trajet
            $table->foreign('trip_id')->references('id')->on('trips')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservations');
    }
};