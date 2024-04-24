import 'package:flutter/material.dart';
import 'package:uniquesmart/ProductFetch/bannerapi.dart';
import 'package:uniquesmart/ProductFetch/combodealapi.dart';
import 'package:uniquesmart/Screen/Login/login.dart';
import 'package:uniquesmart/ProductFetch/brandsapi.dart';
import 'package:uniquesmart/ProductFetch/dashboardapi.dart';
import 'package:uniquesmart/Screen/Profile/profile.dart';
import 'package:uniquesmart/Provider/authprovider.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/Support/faqs.dart';
import 'package:uniquesmart/Screen/Support/paymentpolicy.dart';
import 'package:uniquesmart/splashscreen.dart';
import 'Screen/Cart/cartModel.dart';
import 'ProductFetch/apiservice.dart';
import 'ProductFetch/categoryapi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const UniqueApp());
}

  class UniqueApp extends StatelessWidget {
    const UniqueApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext   context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiService()),
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context)=>CategoryApi()),
        ChangeNotifierProvider(create: (context)=>AuthNotifier(),),
        ChangeNotifierProvider(create: (context) => DashboardApi()),
        ChangeNotifierProvider(create: (context)=> BrandsApi()),
        ChangeNotifierProvider(create: (context)=>comboDealApi()),
        ChangeNotifierProvider(create: (context)=>comboApi())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder:(context, child) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
          ),
          // home:  profileDetails(), 
          home: splashScreen() ,
        ),
      ),
    );
  }
}
