<?php

namespace App\Http\Controllers;

use App\Models\Video;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VideoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $videos = Video::orderBy('title', 'asc')->get();

        return view('admin.video.index', compact('videos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.video.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'video_url' => 'nullable|url',
            'video_file' => 'nullable|file|mimes:mp4,webm|max:102400',
        ]);

        if (!$request->video_url && !$request->hasFile('video_file')) {
            return back()->withErrors([
                'video_url' => 'Isi URL atau upload file video.'
            ])->withInput();
        }

        DB::beginTransaction();

        try {

            $data = [
                'title' => $validated['title'],
                'description' => $validated['description'] ?? null,
            ];

            if ($request->hasFile('video_file')) {
                $path = $request->file('video_file')->store('videos', 'public');
                $data['video_url'] = asset('storage/' . $path);

            } else {
                $data['video_url'] = $validated['video_url'];
            }

            Video::create($data);

            DB::commit();

            return redirect()->route('videos.index')->with('success', 'Video berhasil dibuat!');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Terjadi kesalahan: ' . $e->getMessage())->withInput();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Video $video)
    {
        return view('admin.video.edit', compact('video'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Video $video)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'video_url' => 'nullable|url',
            'video_file' => 'nullable|file|mimes:mp4,webm,mov,avi,mkv|max:102400',
        ]);

        if (!$request->video_url && !$request->hasFile('video_file')) {
            return back()->withErrors([
                'video_url' => 'Isi URL atau upload file video.'
            ]);
        }

        DB::beginTransaction();

        try {
            $data = [
                'title' => $validated['title'],
                'description' => $validated['description'] ?? null,
            ];

            $deleteOldFile = function () use ($video) {
                if (str_contains($video->video_url, 'storage/videos')) {
                    $old = str_replace(asset('storage/') . '/', '', $video->video_url);
                    Storage::disk('public')->delete($old);
                }
            };

            if ($request->hasFile('video_file')) {
                $deleteOldFile();

                $path = $request->file('video_file')->store('videos', 'public');
                $data['video_url'] = asset('storage/' . $path);

            } elseif (!empty($validated['video_url'])) {
                $deleteOldFile();

                $data['video_url'] = $validated['video_url'];

            } else {
                $data['video_url'] = $video->video_url;
            }

            $video->update($data);

            DB::commit();

            return redirect()->route('videos.index')
                ->with('success', 'Video berhasil diperbarui!');

        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error: ' . $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Video $video)
    {
        $video->delete();
        return back()->with('success', 'Video dihapus');
    }
}
