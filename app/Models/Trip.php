<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Trip extends Model
{
    use HasFactory;

    protected $fillable = [
        'driver_id',
        'departure',
        'arrival',
        'date',
        'price',
        'seats_available',
        'status',
        'eco_friendly',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'driver_id');
    }
}
