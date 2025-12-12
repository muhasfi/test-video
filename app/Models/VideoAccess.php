<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VideoAccess extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'video_id',
        'start_access',
        'end_access'
    ];

    protected $casts = [
        'start_access' => 'datetime',
        'end_access' => 'datetime',
    ];

    public function video() 
    { 
        return $this->belongsTo(Video::class); 
    }
    public function user() 
    { 
        return $this->belongsTo(User::class); 
    }
    
    public function isActive() {
        return now()->between($this->start_access, $this->end_access);
    }
}
