import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniquesmart/Support/support.dart';
import 'package:uniquesmart/appbar.dart';
import 'package:uniquesmart/drawer.dart';

// import 'Cart/cart.dart';
// import 'Cart/wishlist.dart';
// import 'Category/category.dart';
// import 'homescreen.dart';
// import 'Login/login.dart';
// import 'Support/support.dart';
// import 'aboutus.dart';

class supportdrawer extends StatefulWidget {
  const supportdrawer({super.key});

  @override
  State<supportdrawer> createState() => _supportdrawerState();
}

class _supportdrawerState extends State<supportdrawer> {
  double value = 0;
   int selectedNavItem = 0; // 
  final Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //     colors: [
          //       Colors.blue,
          //       const Color.fromARGB(255, 246, 246, 246),
          //     ],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   )),
          // ),
          SafeArea(
              child: Container(
            child: drawer(),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: duration,
              builder: (_, double val, __) {
                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY(((pi / 35) * val)),
                    child: Scaffold(
                      // backgroundColor: Colors.white,
                      appBar: barContent(
                          value: value,
                          onTap: () {
                            setState(() {
                              value == 0 ? value = 1 : value = 0;
                            });
                          }),

                      // appBar: AppBar(
                      //   title: Text('3D Drawer'),
                      //   leading: IconButton(
                      //     icon: Icon(Icons.menu),
                      //     onPressed: () {
                      //       setState(() {
                      //         value == 0 ? value = 1 : value = 0;
                      //       });
                      //     },
                      //   ),
                      // ),
                      // DISPLAY YOUR BODY HERE
                      //display different body according to the page
                      body: support(),
                    ));
              })
        ],
      ),
    );
  }
}
