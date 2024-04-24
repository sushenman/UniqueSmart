import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:uniquesmart/ProductFetch/fetchbrandlist.dart';
class Brands extends StatefulWidget {

  const Brands({super.key, required this.title, required this.image});
  final String title; 
  final String image;
  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {

// @override
//   void initState() {
//     fetchbrands();
//     super.initState();
//   }


  @override
  Widget build(BuildContext context) {
    List<String> brandimg = [
      'assets/images/logos.png',
      'assets/images/logos.png',
      'assets/images/logos.png',
      'assets/images/logos.png',
      'assets/images/logos.png',
    ];
    return Container(
      height: 120,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(brandimg[index]),
                ),
              ],
            ),
          );
        },
        itemCount: brandimg.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
