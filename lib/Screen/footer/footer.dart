import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import '../Cart/cartnav.dart';
import '../Category/categorynav.dart';

class footer extends StatefulWidget {
  const footer({super.key});

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  int indexNumber = 0;

  final List<Widget> _screens = [
    animatedDrawer(),
    cartdrawer(),
    categoryDrawer(),
    // Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNumber,
        onTap: (index) {
          setState(() {
            indexNumber = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.blue,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Account',
          //   backgroundColor: Colors.blue,
          // ),
        ],
      ),
    );
  }
}
