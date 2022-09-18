import 'package:flutter/material.dart';
import 'package:geekgarden/app/pages/add_page.dart';
import 'package:geekgarden/app/pages/detail_page.dart';
import 'package:geekgarden/app/pages/home.dart';
import 'package:geekgarden/app/provider/Products.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        AddProduct.routeName: (context) => AddProduct(),
        DetailProduct.routeName: (context) => DetailProduct(),
      },
    ),
    
    );
  }
}
