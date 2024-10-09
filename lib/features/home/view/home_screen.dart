// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:chip_list/chip_list.dart';
// import 'package:provider/provider.dart';

// import 'package:shop_ease/app/views/widgets/my_appbar.dart';
// import 'package:shop_ease/app/view_models/product_view_model.dart';
// import 'package:shop_ease/app/constants/svg_icons.dart';
// import 'package:shop_ease/app/resources/app_strings.dart';
// import 'package:shop_ease/app/resources/app_theme.dart';
// import 'package:shop_ease/features/home/widgets/slider_widget.dart';
// import 'package:shop_ease/app/views/widgets/drawer_widget.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final styles = Theme.of(context).extension<AppTheme>()!;
//     final _productViewModel = Provider.of<ProductViewModel>(context);
//     return SafeArea(
//       child: Scaffold(
//         appBar: const MyAppbar(),
//         body: Column(
//           children: [
//             const SliderWidget(),
//             SizedBox(height: 50.h,),
//             Text(
//               AppStrings.newOnes,
//               style: styles.sfPro20w600,
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//         drawer: DrawerWidget(),
//       ),
//     );
    
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/features/home/view_model/chip_view_model.dart';
import 'package:shop_ease/app/models/products_model.dart';
import 'package:shop_ease/app/services/response/status.dart';

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChipViewModel()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(title: Text("ShopEase")),
        body: Consumer<ChipViewModel>(
          builder: (context, viewModel, child) {
            final productListResponse = viewModel.productList;

            switch (productListResponse.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.completed:
                return Column(
                  children: [
                    // Categories Row
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryChip(viewModel, 'All'),
                          _buildCategoryChip(viewModel, 'CLOTHES'),
                          _buildCategoryChip(viewModel, 'FURNITURE'),
                          _buildCategoryChip(viewModel, 'MISCELLANEOUS'),
                          _buildCategoryChip(viewModel, 'SHOES'),
                        ],
                      ),
                    ),

                    // Product Grid View
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: productListResponse.data!.length > 4
                            ? 4 // Show only four items initially
                            : productListResponse.data!.length,
                        itemBuilder: (context, index) {
                          final product = productListResponse.data![index];
                          return _buildProductCard(product);
                        },
                      ),
                    ),

                    // Explore More Button
                    if (productListResponse.data!.length > 4)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullProductListView(
                                    products: productListResponse.data!),
                              ),
                            );
                          },
                          child: Text("Explore More"),
                        ),
                      ),
                  ],
                );
              case Status.failed:
                return Center(child: Text("Error: ${productListResponse.message}"));
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  // Widget to build category selection chip
  Widget _buildCategoryChip(ChipViewModel viewModel, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
        label: Text(category),
        selected: viewModel.selectedCategory == category,
        onSelected: (isSelected) {
          viewModel.selectCategory(category);
        },
      ),
    );
  }

  // Widget to build a product card
  Widget _buildProductCard(ProductModel product) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.network(product.images.first), // Placeholder for product image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text("\$${product.price.toString()}"),
        ],
      ),
    );
  }
}

// Full Product List Screen
class FullProductListView extends StatelessWidget {
  final List<ProductModel> products;

  FullProductListView({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Products")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(product);
        },
      ),
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.network(product.images.first),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text("\$${product.price.toString()}"),
        ],
      ),
    );
  }
}
