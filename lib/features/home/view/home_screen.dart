import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/app/view_models/product_view_model.dart';
import 'package:shop_ease/app/services/response/status.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productViewModel = ProductViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context)=>ProductViewModel(),
        child: Consumer<ProductViewModel>(
          builder: (context, provider, child){
            return ListView.builder(
              itemCount: provider.productsList.data!.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(index.toString()),
                );
              }
              );
          }
          )
        ),
    );
  }
}