import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniquesmart/splashscreen.dart';

import 'package:provider/provider.dart';

import 'Cart/cartModel.dart';
import 'Login/login.dart';
import 'ProductFetch/apiservice.dart';
import 'ProductFetch/categoryapi.dart';
// import 'ProductFetch/categoryproductlistapi.dart';
// import 'helper/dbhelper.dart';

void main() {
  runApp(const UniqueApp());
}

  class UniqueApp extends StatelessWidget {
    const UniqueApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown, 
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiService()),
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context)=>CategoryApi()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  splashScreen(),
      ),
    );
  }
}
