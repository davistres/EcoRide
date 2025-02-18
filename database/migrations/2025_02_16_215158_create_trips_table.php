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
            $table->unsignedBigInteger('driver_id');
            $table->string('departure');
            $table->string('arrival');
            $table->dateTime('date');
            $table->decimal('price', 8, 2);
            $table->integer('seats_available');
            $table->boolean('eco_friendly')->default(false);
            $table->timestamps();

            $table->foreign('driver_id')->references('id')->on('users')->onDelete('cascade');

            $table->foreignId('user_id')->constrained()->onDelete('cascade');

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
