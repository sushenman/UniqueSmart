import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/ProductDetail/proddescnav.dart';
// import '../ProductDetail/productdesc.dart';
import '../../ProductFetch/apiservice.dart';
import '../../ProductFetch/fetchproduct.dart';

class myProducts extends StatefulWidget {
  //get the api data through constructor

  final String title;
  final String image;
  final String mrp_price;
  final String retailer_price;
  final String slug;

  const myProducts(
      {Key? key,
      required this.title,
      required this.image,
      required this.mrp_price,
      required this.retailer_price,
      required this.slug})
      : super(key: key);

  @override
  _myProductsState createState() => _myProductsState();
}

class _myProductsState extends State<myProducts> {
  // final ApiService apiService = ApiService();

  // @override
  // void initState() {
  //   super.initState();
  //   // Make initState asynchronous
  //   fetchAllData();
  // }

  // // Make fetchAllData asynchronous and return the list
  // Future<void> fetchAllData() async {
  //   await Provider.of<ApiService>(context, listen: false).callApiService();
  //   await apiService.callApiService();
  //   // setState(() {

  //   // });
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(builder: (BuildContext, value, child) {
      return Container(
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount:
                  2, // Adjust the cross-axis count based on your needs
              childAspectRatio: 0.6,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                value.products.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                prodcutDesc(slug: value.products[index].slug),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Color.fromARGB(255, 195, 195, 195),
                          ),
                          boxShadow: [],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 8.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 8.0.h),
                                child: Center(
                                  child: Image.network(
                                    value.products[index].image,
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 8.0.h),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 8.0.w, right: 8.0.w),
                                        child: Text(
                                          value.products[index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13.sp),
                                        ),
                                      ),
                                      Text(''),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 8.0.w, right: 8.0.w),
                                        child: Text(
                                          'Rs ' +
                                              value.products[index].mrp_price
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            decoration:value.products[index].retailer_price.toString() == 0.00? TextDecoration.none : TextDecoration.lineThrough, 
                                          ),
                                        ),
                                      ),
                                      Text(''),
                                      Visibility(
                                        visible: value.products[index].retailer_price.toString() ==
                                                0.00? false : true,
                                        child: Padding(
                                          padding:  EdgeInsets.only(
                                              left: 8.0.w, right: 8.0.w, bottom: 5.h),
                                          child: Text(
                                            'Rs ' +
                                                value.products[index]
                                                    .retailer_price
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'View Details',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'Poppins',
                                              // fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(''),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 10,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )));
    });
  }
}
