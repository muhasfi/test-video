<?php

use App\Http\Controllers\AdminVideoApprovalController;
use App\Http\Controllers\CustomerRequestController;
use App\Http\Controllers\CustomerVideoWatchController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RequestVideoController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VideoController;
use Illuminate\Support\Facades\Route;



// Route::get('/dashboard', function () {
    //     return view('dashboard');
    // })->middleware(['auth', 'verified'])->name('dashboard');
    
Route::get('/', function () {
    return redirect()->route('login');
});



Route::middleware('auth')->group(function () {

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::resource('videos', VideoController::class)->middleware('admin');
    Route::resource('users', UserController::class)->middleware('admin');

    Route::get('/admin/requests', [AdminVideoApprovalController::class, 'index'])->name('approve.requests');
    Route::post('/admin/requests/{id}/approve', [AdminVideoApprovalController::class, 'approve'])->name('admin.requests.approve');
    Route::post('/admin/requests/{id}/reject', [AdminVideoApprovalController::class, 'reject'])->name('admin.requests.reject');

    Route::get('/daftar-video', [CustomerRequestController::class, 'index'])->name('daftar-video');
    Route::post('/video/{id}/request', [CustomerRequestController::class, 'requestAccess'])->name('customer.video.request');

    Route::get('/video/{id}/watch', [CustomerVideoWatchController::class, 'watch'])->name('customer.video.watch');

});

require __DIR__.'/auth.php';
