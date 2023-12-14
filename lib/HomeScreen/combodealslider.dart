import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


// import 'package:carousel_slider/carousel_slider.dart';

class comboDeal extends StatefulWidget {
  comboDeal({super.key});

  final List<String> imageList = [
    'https://www.uniquesmartindustries.com/frontend/images/products/cabc8326-be0a-44ed-a752-2147f52d5ade.webp',
    'https://www.uniquesmartindustries.com/frontend/images/products/6cbe9aad-caa3-458b-a6f2-e05e6e1aa6e3.webp',
  'https://www.uniquesmartindustries.com/frontend/images/products/cd4a657d-5fe1-40f5-80b0-6c2d69ecf2d9.webp',
    'https://www.uniquesmartindustries.com/frontend/images/products/f3a6de35-86f6-45de-80e7-886f27ade6f4.webp',
    'https://www.uniquesmartindustries.com/frontend/images/products/6cbe9aad-caa3-458b-a6f2-e05e6e1aa6e3.webp',
  ];

  @override
  State<comboDeal> createState() => _comboDealState();
}

class _comboDealState extends State<comboDeal> {
  late CarouselController controller;
  int currentIndex = 0;

  @override
  initState() {
    super.initState();
    controller = CarouselController();
  }

  carouselimage() {
    return Container(
      child: CarouselSlider(
        carouselController: controller,
        options: CarouselOptions(
          height: 180,
         viewportFraction: 0.8,
         initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
        //   autoPlayInterval: Duration(seconds: 2),
        //   autoPlayAnimationDuration: Duration(milliseconds: 2000),
        //  autoPlayCurve: Curves.fastOutSlowIn,
         enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        items: widget.imageList.map((e) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 0.0),
                decoration: BoxDecoration(
                  // color: Colors.white,

                ),
                
                child: Image.network(e, fit: BoxFit.cover),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        carouselimage(),
      ],
    ));
  }
}
