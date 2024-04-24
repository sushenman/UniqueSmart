import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/navigationbar/appbar.dart';
import 'package:uniquesmart/drawer.dart';
import 'package:uniquesmart/Screen/footer/footer.dart';

// import 'Cart/cart.dart';
// import 'Cart/wishlist.dart';
// import 'Category/category.dart';
import 'homescreen.dart';
// import 'Login/login.dart';
// import 'Support/support.dart';
// import 'aboutus.dart';
class animatedDrawer extends StatefulWidget {
  const animatedDrawer({super.key});

  @override
  State<animatedDrawer> createState() => _animatedDrawerState();
}

class _animatedDrawerState extends State<animatedDrawer> {
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
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: duration,
            builder: (_, double val, __) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 220 * val)
                  ..rotateY((pi / 95) * val),
                child: Scaffold(
                  appBar: barContent(
                    value: value,
                    onTap: () {
                      setState(() {
                        value == 0 ? value = 1 : value = 0;
                      });
                    },
                  ),
                  body: LandingPage(),
                ),
              );
            },
          ),
        
        ],
      ),
  
    );
  }
}
