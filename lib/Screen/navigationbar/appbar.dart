import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uniquesmart/Screen/Cart/cartnav.dart';
import '../Cart/cart.dart';
import '../Cart/carthelper.dart';
import '../../helper/dbhelper.dart';

class barContent extends StatefulWidget implements PreferredSizeWidget {
  final double value;
  final VoidCallback onTap;

  barContent({required this.value, required this.onTap});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<barContent> createState() => _barContentState();
}

class _barContentState extends State<barContent> {
  int? cartItemCount; // New variable to keep track of cart items
  List<Cart> products = [];
  dbhelper db = dbhelper();
  @override
  void initState() {
    products = [];
    super.initState();
    getCartnumber();
    // setState(() {

    // });
  }

  getCartnumber() async {
    products = await db.getCart();
    setState(() {
    cartItemCount = products.length;

    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Container(
            width: 100,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                widget.onTap();
              },
            ),
          ),
        );
      }),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/images/logof.png',
              fit: BoxFit.cover,
              width: 150,
            ),
          ),
        ],
      ),
      actions: [
        Builder(builder: (BuildContext context) {
          return Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                          future: Future.value(products),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.hasData) {
                              return badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                    badgeColor: Color.fromRGBO(242, 76, 39, 1)),
                                badgeContent: Text(
                                  '${products.length}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                position: badges.BadgePosition.topEnd(
                                    top: -7, end: 1),
                                child: IconButton(
                                  splashRadius: 20,
                                  constraints: BoxConstraints(maxWidth: 45),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => cartdrawer()),
                                    );
                                  },
                                  icon: Icon(Icons.shopping_cart),
                                  color: Colors.black,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.star,
                        //       color: Colors.black,
                        //     ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
