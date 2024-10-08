<?php

namespace App\Services;
use Illuminate\Support\str;
use App\Models\Product;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ProductCollection;
class ProductService
{
    public function getAllProducts()
    {
        $Product= Product::all();
      
        $data['Product'] =  ProductResource::collection( $Product);
        return $data;
    }

    public function getProductById($uuid)
    {
        $Product= Product::find($uuid);
        $data['Product'] = new ProductResource($Product);
        return $Product;
    }

    public function createProduct($productData)
    {$Product = new Product();
        $Product->name = $productData['name'];
        $Product->description = $productData['description'];
        $Product->price =  $productData['price'];
        $Product->uuid=Str::uuid();
        $Product->save();
         
        $data['Product'] = new ProductResource($Product);
        return $data;
    }

    public function updateProduct($uuid,$data)
    {
        $product = Product::find($uuid);
   
        if ($product) {
            $Product=$product->update($data);
            $data['Product'] = new ProductResource($Product);
            return $data;
           
        }
        return null;
    }

    public function deleteProduct($uuid)
    {  
        $product = Product::find($uuid);
        if ($product) {
            $product->delete();
            return true;
        }
        return false;
    }
}