@extends('layouts.master')

@section('title', 'Video')

@section('content')

<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>video</h3>
                <p class="text-subtitle text-muted">Manage video data.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item">video</li>
                        <li class="breadcrumb-item active" aria-current="page">Index</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    
    <section class="section">
        <div class="card">
            
            <div class="card-body">
                <div class="d-flex">
                    <a href="{{ route('videos.create') }}" class="btn btn-primary mb-3 ms-auto">New Video</a>
                </div>

                @if(session('success'))
                    <div class="alert alert-success">
                        {{ session('success') }}
                    </div>
                @endif

                <table class="table table-striped" id="table1">
                    <thead>
                        <tr>
                            <th>no</th>
                            <th>title</th>
                            <th>Description</th>
                            <th>Video Url</th>
                            <th>Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($videos as $video)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $video->title }}</td>
                                <td>{{ Str::limit($video->description, 20) }}</td>
                                <td>{{ Str::limit($video->video_url, 20) }}</td>
                                <td>
                                    <a href="{{ route('videos.edit', $video->id) }}"class="btn btn-warning btn-sm">Edit</a>

                                    <form action="{{ route('videos.destroy', $video->id) }}" method="POST" style="display: inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda Yakin?')">Delete</button>
                                    </form>
                                </td>
                                
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>

@endsection