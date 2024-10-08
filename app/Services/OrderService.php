<?php

namespace App\Services;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Http\Resources\OrderResource;
use App\Http\Traits\GeneralTrait;
use Illuminate\Support\str;

class OrderService
{
    use GeneralTrait;
    public function addAllOrder(array $productData)
    {
        $user = auth('sanctum')->user();
        $order = new Order();
      
        $order->uuid = Str::uuid();
        $order->user()->associate($user)->save();

       /*  foreach ($productData as $data) {
           
            $orderProduct = new OrderProduct();
            $orderProduct->order_id = $order->id;
            $orderProduct->product_id = Product::find($data['product_id']);
            $orderProduct->quantity = $quantity;
            $orderProduct->save();
        } */
        foreach ($productData as $data) {
            $orderProduct = new OrderProduct([
                'product_id' => $data['product_id'],
                'quantity' => $data['quantity'],
                'order_id' => $order->id,
            ]);
            $orderProduct->save();
        }
 
        /* foreach ($products as $productId => $quantity) {
           
            $orderProduct = new OrderProduct();
            $orderProduct->order_id = $order->id;
            $orderProduct->product_id = $productId;
            $orderProduct->quantity = $quantity;
            $orderProduct->save();
      
    } */
        $data['order'] = new OrderResource($order);

        return $this->apiResponse($data, true, null, 200);
       
    }

    public function getOrder($orderId)
    {
        // Retrieve order details
        $order = Order::with('products')->find($orderId);

        return $order;
    }
}