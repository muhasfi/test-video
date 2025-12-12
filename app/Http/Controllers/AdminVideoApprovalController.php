<?php

namespace App\Http\Controllers;

use App\Models\VideoAccess;
use App\Models\VideoRequest;
use Illuminate\Http\Request;

class AdminVideoApprovalController extends Controller
{
    public function index()
    {
        $requests = VideoRequest::with('user', 'video')
            ->whereHas('video')
            ->orderBy('created_at', 'desc')
            ->get();

        return view('admin.video.request_video', compact('requests'));
    }

    public function approve(Request $request, $id)
    {
        $videoRequest = VideoRequest::findOrFail($id);

        $request->validate([
            'duration' => 'required|integer|min:1'
        ]);

        $start = now();
        $end   = now()->addHours((int) $request->duration);

        VideoAccess::create([
            'user_id' => $videoRequest->user_id,
            'video_id' => $videoRequest->video_id,
            'start_access' => $start,
            'end_access' => $end,
        ]);

        $videoRequest->update([
            'status' => 'approved'
        ]);

        return back()->with('success', 'Akses diberikan selama '.$request->duration.' jam.');
    }

    public function reject($id)
    {
        $videoRequest = VideoRequest::findOrFail($id);
        $videoRequest->update(['status' => 'rejected']);

        return back()->with('success', 'Permintaan ditolak.');
    }
}
