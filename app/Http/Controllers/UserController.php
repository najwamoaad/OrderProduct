<?php

namespace App\Http\Controllers;
use App\Services\UserService;
use Illuminate\Http\Request;
use App\Http\Traits\GeneralTrait;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\UserResource;
class UserController extends Controller
{
    protected $userService;
    use GeneralTrait;
    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }
    public function registerUser(Request $request)
    { try{ $validator = Validator::make($request->all(), [
        'name' => 'required',
        'password' => 'required|min:8',
        'email' => ['required', 'email', 'unique:users'],
    ]);


    if ($validator->fails()) {
        return $this->requiredField($validator->errors()->first());
    }
        $userData = $request->only('name', 'email', 'password');

        $registeredUser = $this->userService->registerUser($userData);

         
            return $this->apiResponse($registeredUser, true, NULL , 200);
         
    }
    catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
    }
         
    }

    public function login(Request $request)
    {try {
        $credentials = $request->only('email', 'password');

        $data['token'] = $this->userService->authenticateUser($credentials['email'], $credentials['password']);

        if ($data) {
            return $this->apiResponse($data, true, null, 200);
        }

        return $this->unAuthorizeResponse();
    }
    catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
    }
    }


}
