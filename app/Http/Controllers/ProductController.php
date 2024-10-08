<?php

namespace App\Http\Controllers;
use App\Services\ProductService;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Validator;
use App\Http\Traits\GeneralTrait;
class ProductController extends Controller
{
    use GeneralTrait;
    protected $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }
    public function index()
    {
        return response()->json($this->productService->getAllProducts());
    }
    public function createProduct(Request $request)
    { 
        try{
            $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'description' => 'required|string',
        'price' => 'required|numeric',
    ]);

    if ($validator->fails()) {
        return $this->requiredField($validator->errors()->first());
    }

    $product = $this->productService->createProduct($request->all());
    return $this->apiResponse($product, true, null, 200);

    } catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
 
    }
}

    public function updateProduct(Request $request)
    {
         
       try{
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'price' => 'required|numeric',
        ]);

         if ($validator->fails()) {
        return $this->requiredField($validator->errors()->first());
    }

        $product = $this->productService->updateProduct($request->uuid,$request->all());
        if (!$product) {
          
            return $this->notFoundResponse(['message' => 'Product not found'], 404);
        }
        return $this->apiResponse($product, true, null, 200);
    }
     catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
 
    }
         
         
    }

    public function deleteProduct(Request $request)
    {try{
        if ($this->productService->deleteProduct($request->uuid)) {
            return response()->json(['message' => 'Product deleted successfully']);
        }
        return $this->notFoundResponse(['message' => 'Product not found'], 404);
    }
    catch (\Exception $ex) {
        return $this->apiResponse(null, false, $ex->getMessage(), 500);
 
    }
    }
    

    public function show(Request $request)
    {try{
        $product = $this->productService->getProductById($request->uuid);
        if (!$product) {
            return $this->notFoundResponse(['message' => 'Product not found'], 404);
        }
    
        return $this->apiResponse($product, true, null, 200);
}
        catch (\Exception $ex) {
            return $this->apiResponse(null, false, $ex->getMessage(), 500);
     
        }
    }
}
