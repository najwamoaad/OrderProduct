<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

 
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [UserController::class, 'registerUser']);
Route::post('/login', [UserController::class, 'login']);

Route::middleware(['AuthUser'])->group(function () {
Route::post('/add-all-order', [OrderController::class,'addAllOrder']);

 
Route::post('/CreateProducts', [ProductController::class,'createProduct']);

Route::post('/UpdateProduct', [ProductController::class,'updateProduct']);

Route::post('/DeleteProduct', [ProductController::class,'deleteProduct']);

Route::get('/show', [ProductController::class,'show']);

Route::get('/index', [ProductController::class,'index']);

});