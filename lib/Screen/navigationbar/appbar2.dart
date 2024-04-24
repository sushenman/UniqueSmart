import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uniquesmart/Screen/Cart/cartnav.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import '../Cart/cart.dart';
import '../Cart/carthelper.dart';
import '../../helper/dbhelper.dart';

class appbarContent extends StatefulWidget implements PreferredSizeWidget {


  final String screenTitle;

  appbarContent({required this.screenTitle});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<appbarContent> createState() => _appbarContentState();
}

class _appbarContentState extends State<appbarContent> {
  int? cartItemCount; // New variable to keep track of cart items
  List<Cart> products = [];
  dbhelper db = dbhelper();
  @override
  void initState() {
    super.initState();
    getCartnumber();
    // setState(() {

    // });
  }

  getCartnumber() async {
    products = await db.getCart();
    cartItemCount = products.length;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              child: IconButton(
                  onPressed: () {
                    //go back 
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>animatedDrawer()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            ));
      }),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true ,
      title: Text(widget.screenTitle,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
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
