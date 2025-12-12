<?php

namespace App\Http\Controllers;

use App\Models\Video;
use App\Models\VideoAccess;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomerVideoWatchController extends Controller
{
    public function watch($video_id)
    {
        $user = Auth::user();

        $access = VideoAccess::where('user_id', $user->id)
            ->where('video_id', $video_id)
            ->where('start_access', '<=', now())
            ->where('end_access', '>=', now())
            ->first();

        if (!$access) {
            return redirect()->back()->with('error', 'Akses Anda sudah habis atau belum disetujui admin');
        }

        $video = Video::findOrFail($video_id);

        return view('daftar_video.show', compact('video', 'access'));
    }
}
