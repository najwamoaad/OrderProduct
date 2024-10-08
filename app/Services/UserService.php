<?php

namespace App\Services;
use App\Models\User;
 
use Illuminate\Support\Facades\Auth;

use Illuminate\Support\str;
use App\Http\Traits\GeneralTrait;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Hash;
/* use Tymon\JWTAuth\Facades\JWTAuth;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException; */
class UserService
{
    use GeneralTrait;
    public function registerUser(array $userData)
    {
     
       

        
           
            $user = new User();
        $user->name = $userData['name'];
        $user->email = $userData['email'];
        $user->password = Hash::make($userData['password']);
        $user->uuid=Str::uuid();
        $user->save();
            

           
            $data['user'] = new UserResource($user);
            return   $data;
            
         
    }
    public function authenticateUser($email, $password)
    {
        $user = User::where('email', $email)->first();
        if (!$user) {
            return $this->apiResponse(null, false, 'Invalid email .', 401);
        }
        if (!$user || !Hash::check($password, $user->password)) {
            return $this->apiResponse(null, false, 'Invalid phone password.', 401);
        }

        $token = $user->createToken('token-name')->plainTextToken;

        return $token;
    }

    /* public function loginUser(array $credentials)
    {
        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $token;
    } */
}