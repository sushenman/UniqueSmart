import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:html/parser.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';

import 'package:uniquesmart/drawer.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

import '../Cart/cartModel.dart';
import '../Cart/carthelper.dart';
import '../navigationbar/appbar2.dart';
import '../../helper/dbhelper.dart';
// import 'category.dart';

class prodcutDesc extends StatefulWidget {
  const prodcutDesc({super.key, this.slug});
  final String? slug;

  @override
  State<prodcutDesc> createState() => _prodcutDescState();
}

class _prodcutDescState extends State<prodcutDesc>
    with TickerProviderStateMixin {
  final bool isFavourite = false;
  String? stringResponse;
  Map? mapResponse;
  List listproducts = [];
  List<Cart> products = [];
  dbhelper db = dbhelper();
  int cartItemCount = 0;
  var document;
  @override
  void initState() {
    super.initState();
    getCartnumber();
    retrieveProductdata();
  }

  getCartnumber() async {
    products = await db.getCart();

    setState(() {
      cartItemCount = products.length;
    });
  }

  void updateBadgeCount() {
    setState(() {
      // Update the badge count
      cartItemCount = products.length;
    });
  }

  Future<void> retrieveProductdata() async {
    Uri url = Uri.parse(
        'https://api.uniquesmartindustries.com/api/products/${widget.slug}/show');
    String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Map<String, String> headers = {
      'apikey': apiKey,
      'Content-Type': 'application/json',
    };
    Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // print(response.statusCode);

      // if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      listproducts = mapResponse!['product'];
      document = parse(listproducts[0]['description']);
      return listproducts[0];
    } else {
      throw Exception('Failed to load post');
    }
  }

  double value = 0;
  int selectedNavItem = 0; //
  final Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    List<String> tableList = [
      'List 1',
      'List 2',
      'List 3',
      'List 4',
    ];
    List<String> reviewerNameList = [
      'Reviewer 1',
      'Reviewer 2',
      'Reviewer 3',
      'Reviewer 4',
    ];
    Color _iconColor = const Color.fromARGB(255, 0, 0, 0);
    List<String> reviewsList = [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ];
    TabController _tabController = TabController(length: 3, vsync: this);
    // print(widget.slug);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            child: drawer(),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: duration,
              builder: (_, double val, __) {
                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY(((pi / 35) * val)),
                    child: Scaffold(
                        // extendBodyBehindAppBar: true,
                        // backgroundColor: Colors.white,
                        appBar: appbarContent(screenTitle: ''),
                        body: FutureBuilder(
                            future: retrieveProductdata(),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              // RegExp exp = RegExp(r"<[^>]*>",
                              //     multiLine: true, caseSensitive: true);
                              // String parsedstring1 = listproducts[0]
                              //         ['description']
                              //     .replaceAll(exp, '');
                              // String finalDescription =
                              //     parsedstring1.replaceAll('&nbsp;', ' ');
                              return SlidingUpPanel(
                                panel: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 31.0, left: 29, right: 29),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: Text(
                                                  listproducts[0]['title'],
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  'Rs' +
                                                      listproducts[0]['price'],
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:  EdgeInsets.only(
                                        left: 20.w,
                                        top: 20.h,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.0.w),
                                      child: Text(
                                        'Description',
                                                                        
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:  EdgeInsets.only(right: 19.0.w),
                                        child: SingleChildScrollView(
                                          child: Container(
                                            child: Html(
                                              data: listproducts[0]
                                                  ['description'],
                                              style: {
                                                "html": Style(
                                                    fontSize: FontSize(
                                                        18.0.sp), // Change the font size to your desired value
                                                    textAlign: TextAlign.justify),
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: Container(
                                    //       width: double.maxFinite,
                                    //       child: TabBarView(
                                    //         children: [

                                    //           Container(
                                    //             child: ListView.builder(
                                    //               itemBuilder:
                                    //                   (BuildContext context,
                                    //                       int index) {
                                    //                 return Container(
                                    //                     decoration:
                                    //                         BoxDecoration(),
                                    //                     child: Column(
                                    //                       children: [
                                    //                         Row(
                                    //                           mainAxisAlignment:
                                    //                               MainAxisAlignment
                                    //                                   .spaceEvenly,
                                    //                           children: [
                                    //                             Text(tableList[
                                    //                                 index]),
                                    //                             Text('Value')
                                    //                           ],
                                    //                         ),
                                    //                         Center(
                                    //                             child: SizedBox(
                                    //                           height: 20,
                                    //                         )
                                    //                             // child: Divider(
                                    //                             //   thickness: 1,
                                    //                             //   indent: 100 ,
                                    //                             //   endIndent: 100,
                                    //                             // ),
                                    //                             )
                                    //                       ],
                                    //                     ));
                                    //               },
                                    //               itemCount: tableList.length,
                                    //             ),
                                    //           ),
                                    //           Container(
                                    //             child: Column(
                                    //               children: [
                                    //                 Padding(
                                    //                   padding:
                                    //                       const EdgeInsets.all(
                                    //                           10.0),
                                    //                   child: ElevatedButton(
                                    //                     onPressed: () {
                                    //                       //alert dialogue
                                    //                       showDialog(
                                    //                           context: context,
                                    //                           builder: (BuildContext
                                    //                                   context) =>
                                    //                               AlertDialog(
                                    //                                 title: Text(
                                    //                                     'Leave a Review'),
                                    //                                 content:
                                    //                                     Container(
                                    //                                   height:
                                    //                                       200,
                                    //                                   child:
                                    //                                       Column(
                                    //                                     children: [
                                    //                                       Text(
                                    //                                           'Rate the product'),
                                    //                                       SizedBox(
                                    //                                         height:
                                    //                                             10,
                                    //                                       ),
                                    //                                       Row(
                                    //                                         mainAxisAlignment:
                                    //                                             MainAxisAlignment.center,
                                    //                                         children: [
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 30,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 30,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 30,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 30,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                         ],
                                    //                                       ),
                                    //                                       SizedBox(
                                    //                                         height:
                                    //                                             10,
                                    //                                       ),
                                    //                                       TextField(
                                    //                                         decoration:
                                    //                                             InputDecoration(hintText: 'Write your review here', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                    //                                       ),
                                    //                                       //submit and cancel button
                                    //                                       Row(
                                    //                                         mainAxisAlignment:
                                    //                                             MainAxisAlignment.spaceBetween,
                                    //                                         children: [
                                    //                                           TextButton(
                                    //                                               onPressed: () {
                                    //                                                 Navigator.pop(context);
                                    //                                               },
                                    //                                               child: Text('Submit')),
                                    //                                           TextButton(
                                    //                                               onPressed: () {
                                    //                                                 Navigator.pop(context);
                                    //                                               },
                                    //                                               child: Text('Cancel'))
                                    //                                         ],
                                    //                                       )
                                    //                                     ],
                                    //                                   ),
                                    //                                 ),
                                    //                               ));
                                    //                     },
                                    //                     child: Text(
                                    //                         'Leave a Review'),
                                    //                     style: ButtonStyle(
                                    //                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    //                             RoundedRectangleBorder(
                                    //                                 borderRadius:
                                    //                                     BorderRadius.circular(
                                    //                                         50))),
                                    //                         padding: MaterialStateProperty.all<
                                    //                                 EdgeInsets>(
                                    //                             EdgeInsets.symmetric(
                                    //                                 horizontal:
                                    //                                     40,
                                    //                                 vertical:
                                    //                                     10)),
                                    //                         shadowColor:
                                    //                             MaterialStateProperty.all<Color>(
                                    //                                 Colors.transparent),
                                    //                         elevation: MaterialStateProperty.all<double>(0),
                                    //                         backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(242, 76, 39, 1))),
                                    //                   ),
                                    //                 ),
                                    //                 Expanded(
                                    //                   child: ListView.builder(
                                    //                     itemBuilder:
                                    //                         (BuildContext
                                    //                                 context,
                                    //                             int index) {
                                    //                       return Container(
                                    //                           padding: EdgeInsets
                                    //                               .symmetric(
                                    //                                   horizontal:
                                    //                                       0,
                                    //                                   vertical:
                                    //                                       10),
                                    //                           child: Container(
                                    //                             decoration: BoxDecoration(
                                    //                                 color: const Color
                                    //                                     .fromARGB(
                                    //                                     255,
                                    //                                     217,
                                    //                                     217,
                                    //                                     217)),
                                    //                             child: Column(
                                    //                               children: [
                                    //                                 SizedBox(
                                    //                                   height:
                                    //                                       10,
                                    //                                 ),
                                    //                                 Padding(
                                    //                                   padding: const EdgeInsets
                                    //                                       .symmetric(
                                    //                                       vertical:
                                    //                                           2,
                                    //                                       horizontal:
                                    //                                           15),
                                    //                                   child:
                                    //                                       Row(
                                    //                                     mainAxisAlignment:
                                    //                                         MainAxisAlignment.spaceBetween,
                                    //                                     children: [
                                    //                                       Text(reviewerNameList[
                                    //                                           index]),
                                    //                                       Row(
                                    //                                         children: [
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 18,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 18,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 18,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                           Icon(
                                    //                                             Icons.star,
                                    //                                             size: 18,
                                    //                                             color: Colors.yellow,
                                    //                                           ),
                                    //                                         ],
                                    //                                       )
                                    //                                     ],
                                    //                                   ),
                                    //                                 ),
                                    //                                 SizedBox(
                                    //                                   height:
                                    //                                       10,
                                    //                                 ),
                                    //                                 Padding(
                                    //                                   padding: const EdgeInsets
                                    //                                       .symmetric(
                                    //                                       vertical:
                                    //                                           12,
                                    //                                       horizontal:
                                    //                                           15),
                                    //                                   child:
                                    //                                       Text(
                                    //                                     reviewsList[
                                    //                                         index],
                                    //                                     textAlign:
                                    //                                         TextAlign.justify,
                                    //                                   ),
                                    //                                 ),
                                    //                               ],
                                    //                             ),
                                    //                           ));
                                    //                     },
                                    //                     itemCount:
                                    //                         reviewsList.length,
                                    //                   ),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ],
                                    //         controller: _tabController,
                                    //       )),
                                    // ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //     // Navigator.push(
                                        //     //     context,
                                        //     //     MaterialPageRoute(
                                        //     //         builder: ((context) => checkoutDrawer())));
                                        //   },
                                        //   child: Text('Buy Now'),
                                        //   style: ButtonStyle(
                                        //       shape: MaterialStateProperty.all<
                                        //               RoundedRectangleBorder>(
                                        //           RoundedRectangleBorder(
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       50))),
                                        //       padding: MaterialStateProperty.all<EdgeInsets>(
                                        //           EdgeInsets.symmetric(
                                        //               horizontal: 40,
                                        //               vertical: 10)),
                                        //       shadowColor: MaterialStateProperty.all<Color>(
                                        //           Colors.transparent),
                                        //       elevation: MaterialStateProperty.all<double>(0),
                                        //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(242, 76, 39, 1))),
                                        // ),

                                        ElevatedButton(
                                          onPressed: () {
                                            //if item is added to cart then it will show a snackbar
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text('Item added to cart'),
                                              duration: Duration(seconds: 1),
                                            ));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        animatedDrawer()));
                                            Provider.of<CartModel>(context,
                                                    listen: false)
                                                .addToCart(listproducts[0], 1,
                                                    'false');
                                            updateBadgeCount();
                                          },
                                          child: Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                fontSize: 14.sp,
                                                color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50))),
                                              padding: MaterialStateProperty.all<EdgeInsets>(
                                                  EdgeInsets.symmetric(
                                                      horizontal: 40.w,
                                                      vertical: 10.h)),
                                              shadowColor: MaterialStateProperty.all<Color>(
                                                  Colors.transparent),
                                              elevation: MaterialStateProperty.all<double>(0),
                                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(242, 76, 39, 1))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                body: Column(
                                  children: [
                                    Image.network(listproducts[0]['image'],
                                        fit: BoxFit.fill),
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                                // minHeight: 100,
                                maxHeight: 500,
                                color: Colors.white,
                                // margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                              );
                            })));
              })
        ],
      ),
    );
  }
}
