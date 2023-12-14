import 'dart:async';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniquesmart/Cart/cart.dart';
import 'package:uniquesmart/Cart/cartModel.dart';
import 'package:uniquesmart/Checkout/checkoutnav.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Cart/cartnav.dart';
import '../ProductFetch/fetchproduct.dart';
// import '../Cart/checkout.dart';

class productDescription extends StatefulWidget {
  const productDescription({super.key, required this.slug});
  final slug;

  @override
  State<productDescription> createState() => _productDescriptionState();
}

class _productDescriptionState extends State<productDescription>
    with TickerProviderStateMixin {
  final bool isFavourite = false;
  String? stringResponse;
  Map? mapResponse;
  List listproducts = [];

  @override
  void initState() {
    super.initState();
    // You should call the apiCall here, not in the build method
    // apiCall();
    // print(listproducts);
    retrieveProductdata();
  }

  Future<void> retrieveProductdata() async {
    // Make the api call
    final response = await http.get(Uri.parse(
        'https://www.uniquesmartindustries.com/api/products/${widget.slug}'));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      listproducts = mapResponse!['product'];
      return listproducts[0];
    } else {
      throw Exception('Failed to load post');
    }
  }

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
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  child: Stack(
                    children: [
                      Row(children: [
                        Container(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage('assets/images/0.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Name'),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Email')
                            ],
                          ),
                        )
                      ]),
                      Positioned(
                        child: Container(
                            child: Container(
                          width: 110,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(252, 208, 179, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                        bottom: 0,
                        right: 10,
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LandingPage()),
                  // );
                },
              ),
              ListTile(
                title: Text('Categories'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LandingPage()),
                  // );
                },
              ),
              ListTile(
                title: Text('My Orders'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Brands()),
                  // );
                },
              ),
              ListTile(
                title: Text('My Cart'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LandingPage()),
                  // );
                },
              ),
              ListTile(
                title: Text('Wishlist'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LandingPage()),
                  // );
                },
              ),
              ListTile(
                title: Text('About Company'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LandingPage()),
                  // );
                },
              ),
              ListTile(
                title: Text('Login'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LandingPage()),
                  // );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(child: Image.asset("assets/images/logos.png")),
            );
          }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Builder(builder: (BuildContext context) {
              return Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Container(
                        // width: 35,
                        // height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            badges.Badge(
                              badgeStyle: badges.BadgeStyle(
                                  badgeColor: Color.fromRGBO(242, 76, 39, 1)),
                              badgeContent: Text(
                                '3',
                                style: TextStyle(color: Colors.white),
                              ),
                              position:
                                  badges.BadgePosition.topEnd(top: -7, end: 1),
                              child: IconButton(
                                  splashRadius: 20,
                                  constraints: BoxConstraints(maxWidth: 45),
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              splashRadius: 10,
                              icon: Icon(Icons.menu),
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
        body: FutureBuilder(
            future: retrieveProductdata(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              RegExp exp =
                  RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
              String parsedstring1 =
                  listproducts[0]['description'].replaceAll(exp, '');
              String finalDescription = parsedstring1.replaceAll('&nbsp;', ' ');
              return SlidingUpPanel(
                panel: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 31.0, left: 29, right: 29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                child: Text(
                                  listproducts[0]['title'],
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Rs' + listproducts[0]['price'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                  ),
                                  Text('4.5/5'),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),

                              GestureDetector(
                                  onDoubleTap: () {
                                    //change the color of the icon here
                                    setState(() {
                                      if (_iconColor ==
                                          const Color.fromARGB(255, 0, 0, 0)) {
                                        _iconColor = const Color.fromARGB(
                                            255, 245, 66, 53);
                                      } else {
                                        _iconColor =
                                            Color.fromARGB(255, 0, 0, 0);
                                      }
                                    });
                                    print(_iconColor);
                                  },
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 22,
                                    color: _iconColor,
                                    // fill: 0,
                                  ))
                              // Icon(Icons.favorite_border, size: 18,)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                'Description',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Specification',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Review',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                          controller: _tabController,
                          indicator: UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                              insets: EdgeInsets.symmetric(horizontal: 16.0))),
                    ),
                    Expanded(
                      child: Container(
                          width: double.maxFinite,
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                    child: Text(
                                      // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc ',
                                      //  listproducts[0]['description'],
                                      finalDescription,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(tableList[index]),
                                                Text('Value')
                                              ],
                                            ),
                                            Center(
                                                child: SizedBox(
                                              height: 20,
                                            )
                                                // child: Divider(
                                                //   thickness: 1,
                                                //   indent: 100 ,
                                                //   endIndent: 100,
                                                // ),
                                                )
                                          ],
                                        ));
                                  },
                                  itemCount: tableList.length,
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          //alert dialogue
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    title:
                                                        Text('Leave a Review'),
                                                    content: Container(
                                                      height: 200,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                              'Rate the product'),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                size: 30,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 30,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 30,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 30,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextField(
                                                            decoration: InputDecoration(
                                                                hintText:
                                                                    'Write your review here',
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                          ),
                                                          //submit and cancel button
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Submit')),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Cancel'))
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        child: Text('Leave a Review'),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50))),
                                            padding:
                                                MaterialStateProperty.all<EdgeInsets>(
                                                    EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 10)),
                                            shadowColor: MaterialStateProperty
                                                .all<Color>(Colors.transparent),
                                            elevation:
                                                MaterialStateProperty.all<double>(0),
                                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(242, 76, 39, 1))),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0, vertical: 10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 217, 217, 217)),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 2,
                                                          horizontal: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(reviewerNameList[
                                                              index]),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                size: 18,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 18,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 18,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 18,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 12,
                                                          horizontal: 15),
                                                      child: Text(
                                                        reviewsList[index],
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        },
                                        itemCount: reviewsList.length,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            controller: _tabController,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => checkoutDrawer())));
                          },
                          child: Text('Buy Now'),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10)),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(242, 76, 39, 1))),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // print(widget.slug);
                            // Navigator.push(context , MaterialPageRoute(builder: (context) => cartdrawer(slug: widget.slug  ,)) );
                            Provider.of<CartModel>(context, listen: false)
                                .addToCart(listproducts[0]);
                          },
                          child: Text('Add to Cart'),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10)),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(242, 76, 39, 1))),
                        ),
                      ],
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Image.network(listproducts[0]['image'], fit: BoxFit.fill),
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
            }));
  }
}
