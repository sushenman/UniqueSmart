import 'package:flutter/material.dart';
import 'package:uniquesmart/ProductDetail/productdesc.dart';
import 'package:uniquesmart/Support/support.dart';

import '../HomeScreen/allproducts.dart';
import '../HomeScreen/homescreen.dart';
import 'package:badges/badges.dart' as badges;

class categoryProducts extends StatefulWidget {
  const categoryProducts({super.key});

  @override
  State<categoryProducts> createState() => _categoryProductsState();
}

class _categoryProductsState extends State<categoryProducts> {
List<bool> isFavoriteList = List.generate(10, (index) => false);
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
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
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
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
        physics: ScrollPhysics(),
        child: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text(
                    'Type 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                //dropdown button
                Container(
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.black),
                      // color: const Color.fromARGB(255, 0, 0, 0),

                      ),
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text('Type 1'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Type 2'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Type 3'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('Type 4'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('Type 5'),
                        value: 5,
                      ),
                    ],
                    hint: Text('Filter'),
                    underline: Container(),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                )
              ],
            ),
            Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1.6 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => productDescription()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 67, 67, 67)
                                      .withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 4))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/ups.png',
                                    width: 100,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('UPS Router Backup 12v'),
                                        Text(''),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 15,
                                                ),
                                                Text('3/5'),
                                                Text(' 400'),
                                              ],
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12.0),
                                                child: Ink(
                                                  // color: Colors.red,
                                                  child: IconButton(
                                                      padding: EdgeInsets.zero,
                                                      constraints:
                                                          BoxConstraints(),
                                                      onPressed: () {
                                                        setState(() {
                                                        isFavoriteList[index]   = ! isFavoriteList[index] ;
                                                        });
                                                      },
                                                   icon: Padding(
                                                      padding: const EdgeInsets.all(0.0), 
                                                     child:   isFavoriteList[index] ==false ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                                                      // icon: Icon(
                                                      //   Icons.favorite_border,
                                                      //   color: Colors.black,
                                                      // )
                                                      ),
                                                )) )
                                          ],
                                        ),
                                        Text(''),
                                        Text('Rs 4000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                        Text(''),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('View Details'),
                                            Text(''),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 10,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
