@extends('layouts.master')

@section('title', 'Tonton Video')

@section('content')

@php
    $url = $video->video_url;

    // Cek apakah link YouTube
    $isYoutube = preg_match('/(youtube\.com|youtu\.be)/', $url);

    // Convert ke embed
    if ($isYoutube) {
        // youtu.be/xxxx
        if (preg_match('/youtu\.be\/([^\?]+)/', $url, $m)) {
            $embed = "https://www.youtube.com/embed/" . $m[1];
        }
        // youtube.com/watch?v=xxxx
        elseif (preg_match('/v=([^\&]+)/', $url, $m)) {
            $embed = "https://www.youtube.com/embed/" . $m[1];
        }
    }
@endphp

<div class="page-heading">
    
    <section class="section">
        <div class="card">
            <div class="card-body text-center">
                <div class="page-title">
                    <h3>{{ $video->title }}</h3>
                </div>

                {{-- Jika YouTube tampilkan embed --}}
                @if ($isYoutube)
                    <iframe width="100%" height="480"
                        src="{{ $embed }}"
                        frameborder="0"
                        allowfullscreen>
                    </iframe>
                @else
                    {{-- Jika bukan YouTube tampilkan video biasa --}}
                    <video width="100%" height="480" controls>
                        <source src="{{ $video->video_url }}" type="video/mp4">
                        Browser Anda tidak mendukung tag video.
                    </video>
                @endif

                <hr>
                <p class="text-muted">Anda dapat menonton sampai: 
                    <strong>{{ $access->end_access->format('d M Y H:i') }}</strong>
                </p>

            </div>
        </div>
    </section>
</div>

@endsection
