import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

// import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({super.key});

  final List<String> imageList = [
    'assets/images/0.jpg',
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
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
          height: 150,
         viewportFraction: 0.7,
         initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
         autoPlayCurve: Curves.fastOutSlowIn,
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
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  // color: Colors.white,
                ),
                child: Image.asset(e, fit: BoxFit.cover),
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
        Positioned(
          left: 120,
          bottom: 8.0,
          child: Center(
            child: DotsIndicator(
                dotsCount: widget.imageList.length,
                position: currentIndex,
                onTap: (index) {
                  controller.animateToPage(index);
                },
                decorator: DotsDecorator(
                  color:Color.fromRGBO(242, 76, 39, 1),
                  activeColor: Color.fromARGB(255, 0, 0, 0),
                  size: const Size.fromRadius(5.0),
                  activeSize: const Size(39.0, 12.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
          ),
        )
      ],
    ));
  }
}
