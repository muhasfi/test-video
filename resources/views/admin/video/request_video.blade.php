@extends('layouts.master')

@section('title', 'Request Akses Video')

@section('content')

<div class="page-heading">
    <div class="page-title">
        <h3>Daftar Permintaan Akses Video</h3>
        <p class="text-subtitle text-muted">Kelola permintaan akses dari customer.</p>
    </div>

    <section class="section">
        <div class="card">

            <div class="card-body">
                
                @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                <table class="table table-striped" id="table1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Customer</th>
                            <th>Video</th>
                            <th>Status</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($requests as $req)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $req->user->name }}</td>
                            <td>{{ $req->video->title ?? '--- Video telah di hapus ---' }}</td>
                            <td>
                                @if($req->status == 'pending')
                                    <span class="badge bg-warning">Pending</span>
                                @elseif($req->status == 'approved')
                                    <span class="badge bg-success">Approved</span>
                                @else
                                    <span class="badge bg-danger">Rejected</span>
                                @endif
                            </td>

                            <td>
                                @if($req->status == 'pending')
                                <form action="{{ route('admin.requests.approve', $req->id) }}" method="POST" class="d-inline">
                                    @csrf
                                    <input type="number" name="duration" placeholder="Durasi Jam" class="form-control mb-1" required>
                                    <button class="btn btn-success btn-sm">Approve</button>
                                </form>

                                <form action="{{ route('admin.requests.reject', $req->id) }}" method="POST" class="d-inline">
                                    @csrf
                                    <button class="btn btn-danger btn-sm">Reject</button>
                                </form>
                                @else
                                    <span class="text-muted">Selesai</span>
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
