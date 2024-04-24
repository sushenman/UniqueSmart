import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';

import 'package:uniquesmart/drawer.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

import '../Cart/cartModel.dart';
import '../Cart/carthelper.dart';
import '../navigationbar/appbar2.dart';
import '../../helper/dbhelper.dart';
import 'package:flutter_html/flutter_html.dart';

class ComboproductDesc extends StatefulWidget {
  const ComboproductDesc({super.key, this.slug});
  final String? slug;


  @override
  State<ComboproductDesc> createState() => _ComboproductDescState();
}

TextEditingController fullname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController company = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController remarks = TextEditingController();

class _ComboproductDescState extends State<ComboproductDesc>
   {
  String? stringResponse;
  Map? mapResponse;
  List listproducts = [];
  List<Cart> products = [];
  dbhelper db = dbhelper();
  int cartItemCount = 0;
  @override
  void initState() {
    super.initState();
    // getCartnumber();
    retrieveProductdata();
  }

  // getCartnumber() async {
  //   products = await db.getCart();

  //   setState(() {
  //     cartItemCount = products.length;
  //   });
  // }

  // void updateBadgeCount() {
  //   setState(() {
  //     // Update the badge count
  //     cartItemCount = products.length;
  //   });
  // }

orderForm() async{
  Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/packages/${widget.slug}');
     String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Map<String, String> headers = {
      'apikey': apiKey,
     
    };
    Response response = await http.post(url, headers: headers, body: {
      'name': fullname.text,
      'email': email.text,
      'phone_number': phone.text,
      'company_name': company.text,
      'address': address.text,
      'remarks': remarks.text,
    });
    if (response.statusCode == 200) {
      print(response.body);
      fullname.clear();
      email.clear();
      phone.clear();
      company.clear();
      address.clear();
      remarks.clear();

    } else {
      throw Exception('Failed to load post');
    }
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
                              RegExp exp = RegExp(r"<[^>]*>",
                                  multiLine: true, caseSensitive: true);
                              String parsedstring1 = listproducts[0]
                                      ['description']
                                  .replaceAll(exp, '');
                              String finalDescription =
                                  parsedstring1.replaceAll('&nbsp;', ' ');
                              return SlidingUpPanel(
                                panel: Column(
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
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  'Rs ' +
                                                      listproducts[0]['price'],
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                 
                                   
                                    SingleChildScrollView(
                                      child: Container(
                                         child: Html(data: listproducts[0]['description'],),
                                          ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    
                                                    title: Text(
                                                        'Order Request Form'),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text('Name'),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  fullname,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Email'),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            TextField(
                                                              controller: email,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                                'Phone Number'),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            TextField(
                                                              controller: phone,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Company'),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  company,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Address'),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  address,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Remarks'),
                                                            TextField(
                                                              controller:
                                                                  remarks,
                                                              maxLines: 4,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text('Cancel')),
                                                      TextButton(
                                                          onPressed: () {
                                                            orderForm();
                                                            print('${fullname.text}');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                              'Order Now')),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text(
                                            'Order Now',
                                            style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                fontSize: 14,
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
                                                      horizontal: 40,
                                                      vertical: 10)),
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
