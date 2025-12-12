<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Video extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'description',
        'video_url'
    ];

    public function requests() {
        return $this->hasMany(VideoRequest::class);
    }

    public function accesses() {
        return $this->hasMany(VideoAccess::class);
    }
}
