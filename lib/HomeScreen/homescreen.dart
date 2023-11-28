import 'package:flutter/material.dart';
import 'package:uniquesmart/Cart/cart.dart';
import 'package:uniquesmart/Cart/wishlist.dart';
import 'package:uniquesmart/HomeScreen/product.dart';

import '../Category/category.dart';
import '../Login/login.dart';
import '../Support/support.dart';
import '../aboutus.dart';
import 'allproducts.dart';
import 'ImageSlider.dart';
import 'package:badges/badges.dart' as badges;

import 'brands.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController SearchController = TextEditingController();
    ScrollController scrollController = ScrollController();
    List<String> list = [
      "UPS Router Backup 12v",
      "Bravo home UPS 5200 VA + Tabular Battery 220Ah/48V C20",
      "Savior PWN 50A/120V",
      "Superb solar pcu 2500",
      "Solar PCU Smarten Saver Series 6000"
    ];
    List<String> imageList = [
      "assets/images/0.jpg",
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
      "assets/images/4.jpg"
    ];
    List<String> options = [
      'Flash Sale',
      'New Arrivals',
      'Best Seller',
      'Categories',
      'Support'
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Stack(
                  children: [
                    Row(children: [
                      //create a profile
                      Container(
                        // width: 80,
                        // height: 80,
                        // decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: const Color.fromRGBO(105, 242, 255, 1)),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/images/0.jpg'),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Name'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Email')
                          ],
                        ),
                      )
                    ]),
                    Positioned( bottom: 0, right:10,
                      child: Container(
                        child: Container(
                          width: 110,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(252, 208, 179, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text('Edit Profile', style: TextStyle(), textAlign: TextAlign.center,),
                          ),
                        )
                        ))
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              },
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Categories()),
                );
              },
            ),
            ListTile(
              title: Text('My Orders'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Brands()),
                // );
              },
            ),
            ListTile(
              title: Text('My Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myCart()),
                );
              },
            ),
            ListTile(
              title: Text('Wishlist'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myWishlist()),
                );
              },
            ),
             ListTile(
              title: Text('Support'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => support()),
                );
              },
            ),
            ListTile(
              title: Text('About Company'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aboutUs()),
                );
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(child: Image.asset("assets/images/logos.png")),
          );
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.53,
                  height: 35,
                  child: const TextField(
                    decoration: InputDecoration(
                      // hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                  ),
                ),
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
                    padding: const EdgeInsets.only(right: 0.0),
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
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart),
                                color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            splashRadius: 10,
                            icon: Icon(Icons.menu),
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 5),
              child: ImageSlider(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Center(
                  child: Container(
                      width: 400,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color.fromRGBO(
                                                105, 242, 255, 1)),
                                      ),
                                      Text(
                                        options[index],
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Product(
                image: imageList,
                title: list,
                radius: 45,
                width: 75,
                height: 80,
                backgroundColor: 0xFFF24C27,
                textColor: 0xFFFFFFFF,
                offerColor: 0X00000000),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Limited Time Deals',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Product(
                  image: imageList,
                  title: list,
                  radius: 45,
                  width: 75,
                  height: 80,
                  backgroundColor: 0xFFF24C27,
                  textColor: 0xFFFFFFFF,
                  offerColor: 0xFFF24C27),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Latest Product',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Product(
                image: imageList,
                title: list,
                radius: 45,
                width: 75,
                height: 80,
                backgroundColor: 0xFFF24C27,
                textColor: 0xFFFFFFFF,
                offerColor: 0X000000),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Our Products',
                    style: TextStyle(fontSize: 20) ,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myProducts(),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Our Brands',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(child: Brands())
          ],
        ),
      ),
    );
  }
}
