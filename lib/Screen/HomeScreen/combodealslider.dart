import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:uniquesmart/Screen/ProductDetail/comboproductdetails.dart';


// import 'package:carousel_slider/carousel_slider.dart';

class comboDeal extends StatefulWidget {

  final List<String> image;
  final List<String> title;
  final List<String> slug;

  comboDeal({super.key, required this.image, required this.title, required this.slug});



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
      
         items: [

            for(var i = 0; i < widget.image.length; i++)
              GestureDetector(
                onTap: () {
                  print('Tapped');
                  print(widget.slug[i]);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ComboproductDesc(slug: widget.slug[i],)));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.image[i]),
                      fit: BoxFit.cover,
                    ),
                  ),
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
      ],
    ));
  }
}
