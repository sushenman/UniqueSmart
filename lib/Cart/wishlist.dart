import 'dart:convert';

import 'package:flutter/material.dart';

import '../Category/category.dart';
import '../HomeScreen/homescreen.dart';
import '../Login/login.dart';
import '../Support/support.dart';
import '../aboutus.dart';
import '../appbar.dart';
import 'package:badges/badges.dart' as badges;

class myWishlist extends StatefulWidget {
  const myWishlist({super.key});

  @override
  State<myWishlist> createState() => _myWishlistState();
}

class _myWishlistState extends State<myWishlist> {
  //create a json list
  // final <dynamic, dynamic> JsonProductList = [

  //   {'name': 'Product 1', 'price': 'Rs. 100', 'image': 'assets/images/0.jpg', 'quantity': '1'},
  //   {'name': 'Product 2', 'price': 'Rs. 200', 'image': 'assets/images/0.jpg','quantity': '1'},
  //   {'name': 'Product 3', 'price': 'Rs. 300', 'image': 'assets/images/0.jpg','quantity': '1'}
  // ];
  final Map<String, List> JsonProductList = {
    'name': ['Product 1', 'Product 2'],
    'price': ['Rs 100', 'Rs 100'],
    'image': ['assets/images/0.jpg', 'assets/images/0.jpg'],
    'quantity': [1, 1]
  };
  @override
  Widget build(BuildContext context) {
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
                    Positioned(
                        bottom: 0,
                        right: 10,
                        child: Container(
                            child: Container(
                          width: 110,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(252, 208, 179, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )))
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
            ListTile(
              title: Text('Wishlist'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
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
                  child: Text(
                    'Cart',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
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
      body: Container(

        // height: 400,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    // height: 200,
                    child: Column(
                      children: [
                        
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 120,
                              child: Image.asset(
                                JsonProductList['image']![index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // color: Colors.amber,
                                 width:MediaQuery.of(context).size.width * 0.65 , 
                                height: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 18.0),
                                          child: Text(JsonProductList['name']![index]!),
                                        ),
                                        // SizedBox(width:30 ,),
                                        Icon(
                                          Icons.delete,
                                          // color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                            
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.shopping_cart, size:18 ,color: Colors.red, ),
                                            Text('   Add to Cart', style: TextStyle(color: Colors.red),)
                                          ],
                                        ),
                                        Text(JsonProductList['price']![index]!)
                                      ],
                                      
                                    )
                                    
                                  ],
                                ),
                              ),
                            )
                            
                          ],
                        ),
                        Divider(
                          thickness:1 ,
                          height: 1,
                          
                        ),
                      ],
                    ),
                  );
                },
                itemCount: JsonProductList['name']!.length,
              ),
              
            ),
         ElevatedButton(
              onPressed: () {},
              child: Text('Continue Shopping'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 70, vertical: 10)),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(242, 76, 39, 1))),
            ),
          ],
        ),
      ),
    );
  }
}
