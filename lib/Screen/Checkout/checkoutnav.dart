import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/Checkout/checkout.dart';
import 'package:uniquesmart/Screen/navigationbar/appbar.dart';
import 'package:uniquesmart/drawer.dart';

import '../Cart/carthelper.dart';

// import 'category.dart';


class checkoutDrawer extends StatefulWidget {
  const checkoutDrawer({super.key, required this.selectedItems});
   final List<Cart> selectedItems;

  @override
  State<checkoutDrawer> createState() => checkoutDrawerState();
}

class checkoutDrawerState extends State<checkoutDrawer> {
  double value = 0;
   int selectedNavItem = 0; // 
  final Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                      body: Checkout(selectedItems: widget.selectedItems),
                    ));
              })
        ],
      ),
    );
  }
}
