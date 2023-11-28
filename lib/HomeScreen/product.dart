import 'package:flutter/material.dart';

import '../ProductDetail/productdesc.dart';


class Product extends StatefulWidget {
  final List<String> image;
  final List<String> title;
  final double radius;
  final double width;
  final double height;
  final int backgroundColor;
  final int textColor;
  final int offerColor;


  Product(
      {super.key,
      required this.image,
      required this.title,
      required this.radius,
      required this.width,
      required this.height, 
      required this.backgroundColor,
       required this.textColor,
       required this.offerColor
      //  required this.color
       });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
    
         width: MediaQuery.of(context).size.width,
         height: 140,
        child: Stack(
          children: [
            
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // height: 10,
                 
                  child: GestureDetector(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> productDescription()) ),
                    child: Stack(
                      children: [
                     
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Positioned(
                              child: Container(
                            child: CircleAvatar(
                              radius: widget.radius,
                    
                              backgroundImage: AssetImage(widget.image[index]),
                            ),
                          ),
                          
                          // top: 110,
                          // right: 100,
                          ),
                        ),
                       
                        Positioned(
                          child: Container(
                              width: widget.width,
                              // height: widget.height,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(widget.backgroundColor)),
                              child: Padding(
                                padding: const EdgeInsets.only(top:4.0, left: 8.0,right: 4.0,bottom: 3.0),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  text: TextSpan(
                                      text: widget.title[index],
                                      style: TextStyle(
                                          color: Color(widget.textColor),
                                      
                                          fontSize: 10)),
                                ),
                              )),
                          top: 90,
                          left:22,
                        ),
                          Positioned(
                                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(widget.offerColor),
                        borderRadius: BorderRadius.circular(100))),
                                top: 5,
                                left: 10,
                              ),
                      ],
                    ),
                  ),
                  //   child: Stack(children: [
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Column(
                  //           children: [
                  //             CircleAvatar(
                  //               radius: widget.radius,
                  //               backgroundImage: AssetImage(widget.image[index]),
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   color: Color.fromRGBO(242, 76, 39, 1)),
                  //               width: widget.width,
                  //               // height: widget.height,
                  //               child: RichText(
                  //                 textAlign: TextAlign.center,
                  //                 maxLines: 2,
                  //                 text: TextSpan(
                  //                     text: widget.title[index],
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 10)),
                  //               ),
                  //             )
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ]),
                );
              },
              itemCount: 4,
              scrollDirection: Axis.horizontal,
            ),
         
         
          ],
        ),
      );
    
  }
}
