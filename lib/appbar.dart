import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uniquesmart/Cart/cartnav.dart';

import 'Cart/cart.dart';

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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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
          Image.asset('assets/images/logof.png', width: 200, height: 100),
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
                    // width: 35,
                    // height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        badges.Badge(
                          badgeStyle: badges.BadgeStyle(
                              badgeColor: Color.fromRGBO(242, 76, 39, 1)),
                          badgeContent: Text(
                            '3',
                            style: TextStyle(color: Colors.white),
                          ),
                          position:
                              badges.BadgePosition.topEnd(top: -7, end: 1),
                          child: IconButton(
                              splashRadius: 20,
                              constraints: BoxConstraints(maxWidth: 45),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> cartdrawer() ) );
                              },
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.black),
                        ),
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
