import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uniquesmart/ProductFetch/fetchproduct.dart';

import '../ProductDetail/productdesc.dart';
import '../ProductFetch/apiservice.dart';

class ProductList extends StatefulWidget {
  final String image;
  final String title;
  final double radius;
  final double width;
  final double height;
  final int backgroundColor;
  final int textColor;
  final int offerColor;

  ProductList({
    Key? key,
    required this.image,
    required this.title,
    required this.radius,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.offerColor,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // Constants for better readability
  static const double productContainerHeight = 120;
  // static const double avatarPadding = 15;
  static const double labelContainerTop = 90;
  static const double labelContainerLeft = 22;
  static const double labelPadding = 4;
  static const double offerContainerTop = 5;
  static const double offerContainerLeft = 10;
  static const double offerContainerSize = 40;

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
      builder: (context, apiService, child) {
        if (apiService.products.isEmpty) {
          return Container(); // Return an empty container or a loading indicator
        }
        print(apiService.products.length);
        return Container(
          width: MediaQuery.of(context).size.width,
          height: productContainerHeight,
          child: ListView.builder(
            itemBuilder: (context, int index) {
              if (index >= apiService.products.length) {
                return Container(); // Return an empty container if index is out of bounds
              }

              return GestureDetector(
                onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => productDescription(
                                  slug: apiService.products[index].slug),
                            ),
                          );
                } ,
                child: Container(
                  height: productContainerHeight,
                  child: Stack(
                    children: [
                      Container(
                        height: 190,
                        // width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left:12,right: 19),
                          child: Container(
                            child: Image.network(
                            width: 100,
                              apiService.products[index].image,
                              fit: BoxFit.contain,
                      
                            ),
                          ),
                          // child: CircleAvatar(
                          //   backgroundColor: Colors.white,
                          //   radius: widget.radius,
                          //   backgroundImage:
                          //       NetworkImage(apiService.products[index].image),
                          // ),
                        ),
                      ),
                      Positioned(
                        top: labelContainerTop,
                        left: labelContainerLeft,
                        child: Container(
                          width: widget.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(widget.backgroundColor),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: labelPadding,
                              left: labelPadding,
                              right: labelPadding,
                              bottom: labelPadding,
                            ),
                            child: RichText(
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              text: TextSpan(
                                text: apiService.products[index].title,
                                style: TextStyle(
                                  color: Color(widget.textColor),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: offerContainerTop,
                        left: offerContainerLeft,
                        child: Container(
                          width: offerContainerSize,
                          height: offerContainerSize,
                          decoration: BoxDecoration(
                            color: Color(widget.offerColor),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 4,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
