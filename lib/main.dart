import 'package:flutter/material.dart';
import 'package:flutter_application/product.dart';
import 'package:flutter_application/product_form.dart';
import 'package:flutter_application/side_navigation.dart';
import 'database.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ProductForm(),
      drawer: const SideNavigation(),
    );
  }
}
