<?php

namespace App\Http\Controllers;

use App\Models\Video;
use App\Models\VideoRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class CustomerRequestController extends Controller
{

    public function index()
    {
        // load video + request & access relasi untuk user ini
        $videos = Video::with([
            'requests' => function ($q) {
                $q->where('user_id', Auth::id());
            },
            'accesses' => function ($q) {
                $q->where('user_id', Auth::id());
            }
        ])->get();

        return view('daftar_video.index', compact('videos'));
    }
    
    public function requestAccess($video_id)
    {
        $user = Auth::user();

        $existing = VideoRequest::where('user_id', $user->id)
            ->where('video_id', $video_id)
            ->where('status', 'pending')
            ->first();

        if ($existing) {
            return back()->with('error', 'Anda sudah mengajukan request dan menunggu persetujuan admin.');
        }

        VideoRequest::create([
            'user_id' => $user->id,
            'video_id' => $video_id,
            'status' => 'pending'
        ]);

        return back()->with('success', 'Permintaan akses telah dikirim ke admin.');
    }
}
