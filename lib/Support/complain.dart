import 'dart:io';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uniquesmart/Support/support.dart';

import '../Category/category.dart';
import '../HomeScreen/homescreen.dart';
import '../Login/login.dart';
import '../aboutus.dart';

class complain extends StatefulWidget {
  const complain({super.key});

  @override
  State<complain> createState() => _complainState();
}

class _complainState extends State<complain> {


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
                  width: MediaQuery.of(context).size.width * 0.55,
                  // height: 25,
                  child: Text(
                    'Book a Complain',
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Book your complaints with us and our customer care team will get back to you',
                  textAlign: TextAlign.left,
                ),
              ),

              //  ----------------------------------------------------Name-------------------------------------------//
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),

              // ----------------------------------------------------Email-------------------------------------------//
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),

              // ---------------------------------------------------Phone No--------------------------------------//
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),

              //----------------------------------------------------Address------------------------------------//
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),

              //----------------------------------------------Category---------------------------------------//
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton(
                      hint: Text('Select Category'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Item 1'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('Item 1'),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text('Item 1'), value: 3),
                        DropdownMenuItem(child: Text('Item 1'), value: 4),
                      ],
                      onChanged: (value) {}),
                ),
              ),

              //----------------------------------------------Customer Type-------------------------------------//
                    Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton(
                      hint: Text('Customer Type'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Item 1'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('Item 1'),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text('Item 1'), value: 3),
                        DropdownMenuItem(child: Text('Item 1'), value: 4),
                      ],
                      onChanged: (value) {}),
                ),
              ),

              //----------------------------------------------Serialization Number---------------------------------------//
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Serial Number',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            
            // ----------------------------------------------Subject---------------------------------------//  
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Subject',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            
            //----------------------------------------------Message---------------------------------------//
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            

          
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Center(
                       child: ElevatedButton(
                                   onPressed: () {},
                                   child: Text('Submit'),
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
                     ),
                   ),
            ],
          )),
        ),
      ),
    );
  }
}
