import 'package:flutter/material.dart';
import 'package:shop_ease/app/views/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
      drawer: DrawerWidget(),
    );
    
  }
}