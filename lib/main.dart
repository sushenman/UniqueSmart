import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniquesmart/Cart/checkout.dart';

import 'Category/category.dart';
import 'HomeScreen/homescreen.dart';

void main() {
  
  runApp(const UniqueApp());
}

class UniqueApp extends StatefulWidget {
  const UniqueApp({super.key});

  @override
  State<UniqueApp> createState() => _UniqueAppState();
}

class _UniqueAppState extends State<UniqueApp> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      //  home: Checkout(),
      //  home: productDescription(),
      // home: Register(),
      home: Categories(),
      // home: complain(),
      // home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
