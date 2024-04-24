import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/ProductDetail/proddescnav.dart';
import 'package:uniquesmart/ProductFetch/fetchproduct.dart';

// import '../ProductDetail/productdesc.dart';
import '../../ProductFetch/apiservice.dart';

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
  static const double productContainerHeight = 160;
  // static const double avatarPadding = 15;
  static  double labelContainerTop = 90.h;
  static  double labelContainerLeft = 22.w;
  static  double labelPadding = 4.w;
  static  double offerContainerTop = 5.h;
  static  double offerContainerLeft = 10.w;
  static  double offerContainerSize = 40.w;

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
          height: 150.w,
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
                              builder: (context) => prodcutDesc(
                                  slug: apiService.products[index].slug),
                            ),
                          );
                } ,
                child: Container(

                  child: Stack(
                    children: [
                      Container(
                        height: 130.w,
                        // width: 150,
                        child: Padding(
                          padding:  EdgeInsets.only(left:12.w,right: 19.w),
                          child: Container(
                            child: Image.network(
                            width: 100,
                              apiService.products[index].image,
                              fit: BoxFit.contain,
                      
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: labelContainerTop,
                        left: labelContainerLeft,
                        child: Container(
                          width: widget.width,
                          height: 50 ,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                            maxHeight: 100.w,
                            minHeight: 40, 
                          ) ,
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
                                  fontFamily: 'Poppins' ,
                                  color: Color(widget.textColor),
                                  fontSize: 10.sp,
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
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
 
  }
}
