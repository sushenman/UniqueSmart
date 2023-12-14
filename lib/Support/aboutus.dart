import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniquesmart/appbar.dart';
import 'package:uniquesmart/drawer.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}
class _aboutUsState extends State<aboutUs> {
  double value = 0;
  final Duration duration = Duration(milliseconds: 300);
  List<String> Title = [
    'Address',
    'Opening Hours',
    'Contact Us at',
    'Email',
    'Website'
  ];
  List<String> Content = [
    'Location Name',
    'Monday - Friday: 10:00 - 18:00',
    'Phone: 01-1234567',
    'abc@abc.abc',
    'www.uniquesmart.com.np'
  ];

  Widget buildAboutUsItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 69, 69, 69),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              child: drawer(),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: duration,
            builder: (_, double val, __) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 220 * val)
                  ..rotateY(((pi / 70) * val)),
                child: Scaffold(
                  appBar: barContent(
                    value: value,
                    onTap: () {
                      setState(() {
                        value == 0 ? value = 1 : value = 0;
                      });
                    },
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Container(
                      child: Center(
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Unique Smart is a leading online shopping platform in Nepal. We are a team of young, energetic and highly motivated individuals who strive to ensure the best service and products for our customers. We believe shopping should be fun and enjoyable, and we work hard to make sure you do!',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                for (int index = 0; index < Title.length; index++)
                                  buildAboutUsItem(Title[index], Content[index]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

