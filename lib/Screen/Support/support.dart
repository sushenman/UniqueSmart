import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uniquesmart/Screen/Support/faqs.dart';
import 'package:uniquesmart/Screen/Support/paymentpolicy.dart';

import 'package:uniquesmart/Screen/navigationbar/bottomnabbar.dart';

import '../Category/category.dart';
import '../HomeScreen/homescreen.dart';
import '../Login/login.dart';
import 'aboutus.dart';
import 'complain.dart';

class support extends StatefulWidget {
  const support({super.key});

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  List<String> Title = [
    'Book a Complain',
    'Frequently Asked Questions',
    'Payment Policy',
    'About Us',
  ];
  List<Widget> navigationLink = [
    complain(),
    Faqs(),
    Payment_Policy(),
    aboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
          ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 198, 197, 196),
                                  offset: Offset(4, 1),
                                  blurRadius: 2,
                                  spreadRadius: 0)
                            ]),
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        navigationLink[index]));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      Title[index],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 15,
                              )
                            ],
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal: 26, vertical: 15)),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 255, 255, 255)),
                            elevation: MaterialStateProperty.all<double>(4),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: Title.length,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
                child: CustomBottomNavigationBar(
              initialIndex: 3,
            )),
          )
        ]),
      ),
    );
  }
}
