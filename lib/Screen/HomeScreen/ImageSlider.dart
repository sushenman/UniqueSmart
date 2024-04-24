import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

// import 'package:carousel_slider/carousel_slider.dart';
class ImageSlider extends StatefulWidget {
  final List<String> image;
  final List<String> title;

  ImageSlider({Key? key, required this.title, required this.image}) : super(key: key);

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
          height: 190,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 3000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        items: [
          for (var i = 0; i < widget.image.length; i++)
            Container(
              child: Image.network(
                widget.image[i],
                // fit: BoxFit.cover,
              ),
            ),
        ],
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
              // child: DotsIndicator(
              //   dotsCount: widget.image.length,
              //   position: currentIndex, // Convert to double
              //   onTap: (index) {
              //     controller.animateToPage(index);
              //   },
              //   decorator: DotsDecorator(
              //     color: Color.fromRGBO(242, 76, 39, 1),
              //     activeColor: Color.fromARGB(255, 0, 0, 0),
              //     size: const Size.fromRadius(5.0),
              //     activeSize: const Size(39.0, 12.0),
              //     activeShape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //   ),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
