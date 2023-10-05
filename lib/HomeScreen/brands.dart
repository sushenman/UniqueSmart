import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

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
        child: ListView.builder(itemBuilder: (BuildContext context, int index){
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
        }, itemCount: brandimg.length,
        scrollDirection:  Axis.horizontal,
        
      ),
    );
  }
}
