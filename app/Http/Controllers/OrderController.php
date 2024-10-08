<?php

namespace App\Http\Controllers;
use App\Http\Traits\GeneralTrait;
use App\Models\Product;
use App\Models\OrderProduct;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\str;
use PhpParser\Node\Stmt\Return_;
use App\Services\OrderService;
 

class OrderController extends Controller
{
    use GeneralTrait;
    protected $orderService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }
    public function addAllOrder(Request $request)
    {try {
         
        $request->validate([
            'products' => 'required|array',
            'products.*.product_id' => 'required|exists:products,id',
            'products.*.quantity' => 'required|integer|min:1',
        ]);

        $order = $this->orderService->addAllOrder($request->input('products'));


       
        
         

        return $this->apiResponse($order, true, null, 200);
    } catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
    }
         
       
    }

    public function getOrder($orderId)
    {try{
        $order = $this->orderService->getOrder($orderId);

        
        return $this->apiResponse($order, true, null, 200);
    }
    catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
    }
    }
}
