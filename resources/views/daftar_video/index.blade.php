@extends('layouts.master')

@section('title', 'Daftar Video')

@section('content')

<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Daftar Video</h3>
                <p class="text-subtitle text-muted">Pilih video untuk ditonton.</p>
            </div>
        </div>
    </div>

    <section class="section">
        <div class="card">
            <div class="card-body">

                @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                @if(session('error'))
                    <div class="alert alert-danger">{{ session('error') }}</div>
                @endif

                <table class="table table-striped" id="table1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Judul</th>
                            <th>Deskripsi</th>
                            <th>Status</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($videos as $video)
                        @php
                            $request = $video->requests->where('user_id', auth()->id())->sortByDesc('id')->first();
                            $access = $video->accesses->where('user_id', auth()->id())->sortByDesc('id')->first();
                        @endphp

                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $video->title }}</td>
                            <td>{{ $video->description }}</td>
                            <td>
                                @if($access && now()->between($access->start_access, $access->end_access))
                                    <span class="badge bg-success">Akses Aktif</span>
                                @elseif($request && $request->status == 'pending')
                                    <span class="badge bg-warning">Menunggu Persetujuan</span>
                                @elseif($request && $request->status == 'rejected')
                                    <span class="badge bg-danger">Ditolak</span>
                                @else
                                    <span class="badge bg-secondary">Belum Akses</span>
                                @endif
                            </td>

                            <td>
                                @if($access && now()->between($access->start_access, $access->end_access))
                                    <a href="{{ route('customer.video.watch', $video->id) }}" 
                                       class="btn btn-success btn-sm">
                                        Tonton
                                    </a>

                                @elseif($request && $request->status == 'pending')
                                    <button class="btn btn-warning btn-sm" disabled>
                                        Pending
                                    </button>

                                @elseif($request && $request->status == 'rejected')
                                    <form action="{{ route('customer.video.request', $video->id) }}" method="POST">
                                        @csrf
                                        <button class="btn btn-primary btn-sm">Request Ulang</button>
                                    </form>

                                @else
                                    <form action="{{ route('customer.video.request', $video->id) }}" method="POST">
                                        @csrf
                                        <button class="btn btn-primary btn-sm">Request Akses</button>
                                    </form>
                                @endif
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
