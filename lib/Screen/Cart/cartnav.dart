import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/Cart/cart.dart';
import 'package:uniquesmart/Screen/HomeScreen/homescreen.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import 'package:uniquesmart/Screen/navigationbar/appbar.dart';
import 'package:uniquesmart/drawer.dart';
import 'package:badges/badges.dart' as badges;

import '../navigationbar/appbar2.dart';

// import 'category.dart';

class cartdrawer extends StatefulWidget {
  const cartdrawer({super.key, this.slug});
  final String? slug;

  @override
  State<cartdrawer> createState() => _cartdrawerState();
}

class _cartdrawerState extends State<cartdrawer> {
  double value = 0;
  int selectedNavItem = 0; //
  final Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    // print(widget.slug);
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
                      appBar: appbarContent(screenTitle: 'Cart') ,
                      body: myCart(slug: widget.slug),
                    ));
              })
        ],
      ),
    );
  }
}
