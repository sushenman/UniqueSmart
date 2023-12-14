import 'package:flutter/material.dart';
import 'package:uniquesmart/Category/categorynav.dart';
import 'package:uniquesmart/HomeScreen/landingdrawer.dart';
import 'package:uniquesmart/Support/supportdrawer.dart';
import 'package:uniquesmart/order.dart';

// import 'Cart/cart.dart';
import 'Cart/cartnav.dart';
// import 'Cart/wishlist.dart';
// import 'Category/category.dart';
import 'HomeScreen/homescreen.dart';
import 'Login/login.dart';
import 'Support/support.dart';
import 'Support/aboutus.dart';
import 'Wishlist/wishlistnav.dart';

// enum DrawerPage {
//   home,
//   categories,
//   myOrders,
//   myCart,
//   wishlist,
//   support,
//   aboutCompany,
//   login,
// }
List<String> navigationItems = [
  'Home',
  'Categories',
  'My Orders',
  'My Cart',
  'Wishlist',
  'Support',
  'About Company',
  'Profile',
  'Logout'
];

List<IconData> icons = [
  Icons.home,
  Icons.category,
  Icons.shopping_cart,
  Icons.shopping_cart,
  Icons.favorite,
  Icons.support,
  Icons.info,
  Icons.login,
  Icons.logout
];

List<Widget> pages = [
  animatedDrawer(),
  categoryDrawer(),
  myOrder(),
  cartdrawer(),
  wishlistDrawer(),
  supportdrawer(),
  aboutUs(),
  Login(),
];

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 200,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(242, 76, 39, 0.8),
        padding: EdgeInsets.all(2),
        child: Column(
          children: [
            Container(
              height: 200,
              child: DrawerHeader(
                // height: 200,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/0.jpg'),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'JohnDoe@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: navigationItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          navigationItems[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      if (pages[index] == pages[0]) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
