<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'uuid',
        'user_id',
      
    ];
    protected $appends = ['total'];
    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public function productOrders()
    {
        return $this->hasMany(OrderProduct::class);
    }

    public function getTotalAttribute()
    {
        return $this->productOrders->sum(function ($productOrders) {
            return $productOrders->product->price * $productOrders->quantity;
        });
    }
}
