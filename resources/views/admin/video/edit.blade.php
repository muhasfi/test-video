@extends('layouts.master')

@section('title', 'Edit Video')

@section('content')

<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Video</h3>
                <p class="text-subtitle text-muted">Manage Video data</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('videos.index') }}">Video</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    
    <section class="section">
        <div class="card">
            
            <div class="card-body">

                @if (session('success'))
                    <div class="alert alert-success">
                        {{ session('success') }}
                    </div>
                @elseif(session('error'))
                    <div class="alert alert-danger">
                        {{ session('error') }}
                    </div>
                @endif
                
                <form action="{{ route('videos.update', $video->id) }}" method="POST" enctype="multipart/form-data">
                   @csrf
                   @method('PUT')
        
                    <div class="mb-3">
                        <label for="" class="form-label">Title</label>
                        <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ old('title', $video->title) }}" required>
                        @error('title')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
        
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea  name="description" id="description" class="form-control @error('description') is-invalid @enderror" rows="4" required>{{ old('description', $video->description) }}</textarea>
                        @error('description')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Tipe Input Video</label>
                        <select id="video_type" class="form-select">
                            <option value="url" {{ $video->video_url && !str_contains($video->video_url, 'storage/videos') ? 'selected' : '' }}>
                                Gunakan URL
                            </option>
                            <option value="file" {{ $video->video_url && str_contains($video->video_url, 'storage/videos') ? 'selected' : '' }}>
                                Upload File Video
                            </option>
                        </select>
                    </div>

                    {{-- Input URL --}}
                    <div class="mb-3" id="video_url_box">
                        <label class="form-label">Video URL</label>
                        <input 
                            type="text"
                            class="form-control @error('video_url') is-invalid @enderror"
                            name="video_url"
                            value="{{ old('video_url', str_contains($video->video_url, 'storage/videos') ? '' : $video->video_url) }}"
                        >
                        @error('video_url')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- Input File --}}
                    <div class="mb-3 d-none" id="video_file_box">
                        <label class="form-label">Upload Video Baru</label>
                        <input 
                            type="file"
                            class="form-control @error('video_file') is-invalid @enderror"
                            name="video_file"
                            accept="video/*"
                        >
                        @error('video_file')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror

                        @if(str_contains($video->video_url, 'storage/videos'))
                            <small class="text-muted">Video sekarang: {{ basename($video->video_url) }}</small>
                        @endif
                    </div>
        
                    <button type="submit" class="btn btn-primary">Update Video</button>
                    <a href="{{ route('videos.index') }}" class="btn btn-secondary">Back to Task List</a>

                </form>
            </div>
        </div>
    </section>
</div>

<script>
function updateInputType() {
    let type = document.getElementById('video_type').value;

    const urlBox  = document.getElementById('video_url_box');
    const fileBox = document.getElementById('video_file_box');

    if (type === 'url') {
        urlBox.classList.remove('d-none');
        fileBox.classList.add('d-none');
    } else {
        urlBox.classList.add('d-none');
        fileBox.classList.remove('d-none');
    }
}

document.getElementById('video_type').addEventListener('change', updateInputType);

// jalankan sekali saat page load
updateInputType();
</script>

@endsection