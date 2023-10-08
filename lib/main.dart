import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniquesmart/HomeScreen/ImageSlider.dart';
import 'package:uniquesmart/HomeScreen/product.dart';
import 'package:uniquesmart/ProductDetail/productdesc.dart';

import 'HomeScreen/allproducts.dart';
import 'HomeScreen/brands.dart';
import 'HomeScreen/homescreen.dart';
import 'ProductDetail/tabController.dart';

void main() {
  
  runApp(const UniqueApp());
}

class UniqueApp extends StatefulWidget {
  const UniqueApp({super.key});

  @override
  State<UniqueApp> createState() => _UniqueAppState();
}

class _UniqueAppState extends State<UniqueApp> {
  // List<int> color=[0xFFF24C27, 0xFFFFFFFF,
  // ];
  // @override
  // void initState() {
  //   super.initState();
  //   print(imageList[1]);
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      //  home: LandingPage(),
       home: productDescription(),
      // home: PopularMountains(),
      debugShowCheckedModeBanner: false,
    );
  }
}
