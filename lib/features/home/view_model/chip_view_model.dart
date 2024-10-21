// import 'package:flutter/material.dart';
// import 'package:shop_ease/app/repository/product_repo.dart';
// import 'package:shop_ease/app/services/response/status.dart';
// import 'package:shop_ease/app/models/products_model.dart';
// import 'package:shop_ease/app/services/response/api_response.dart';

// class ChipViewModel with ChangeNotifier {

//   final ProductRepository productRepo = ProductRepository() ;

//   ApiResponse<List<ProductModel>> productList = ApiResponse.loading();

//   String selectedCategory = "All";


//   Future<void> fetchProducts() async{
//     productList = ApiResponse.loading();
//     notifyListeners();
//     try{
//       // final products = await productRepo.fetchProducts();
//       // productList = ApiResponse.completed(products);
//     }catch(error){
//       productList = ApiResponse.failed(error.toString());
//     }
//   }

//   void selectCategory(String category){
//     selectedCategory = category;

//     if(productList.status == Status.completed && productList.data != null){
//       if(category == "All"){
//         productList = ApiResponse.completed(productList.data);
//       }else{
//         List<ProductModel> filteredProducts =  productList.data!.where((product)=>product.category.name.toString() == category.toUpperCase()).toList();
//         productList = ApiResponse.completed(filteredProducts);
//       }
//     }
//     notifyListeners();
//   }
// }