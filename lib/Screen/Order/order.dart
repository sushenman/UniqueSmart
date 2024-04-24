import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/Order/orderdetails.dart';
import 'package:http/http.dart' as http;

import '../../Provider/authprovider.dart';

class myOrder extends StatefulWidget {
  const myOrder({super.key});

  @override
  State<myOrder> createState() => _myOrderState();
}

List<String> slug = [];
List<String> orderId = [];
List<String> orderDate = [];
List<String> orderStatus = [];
List<String> totalAmount = [];
late AuthNotifier authNotifier;

class _myOrderState extends State<myOrder> {
  @override
  void initState() {
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchOrder(authNotifier.token);
    });
    super.initState();
  }

  Future<void> fetchOrder(String token) async {
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/orders');
    Response response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final jsonData1 = jsonData as Map<String, dynamic>;
      print('Data fetched successfully');
      print('Data: $jsonData1');
      slug.clear();
      orderId.clear();
      orderDate.clear();
      orderStatus.clear();
      totalAmount.clear();
      for (var i = 0; i < jsonData1['orders'].length; i++) {
        slug.add(jsonData1['orders'][i]['slug']);
        orderId.add(jsonData1['orders'][i]['order_id']);
        orderDate.add(jsonData1['orders'][i]['order_date']);
        orderStatus.add(jsonData1['orders'][i]['status']);
        totalAmount.add(jsonData1['orders'][i]['total_amount']);
      }

      print('slug: $slug');
      print('orderId: $orderId');
      print('orderDate: $orderDate');
      print('orderStatus: $orderStatus');
      print('totalAmount: $totalAmount');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        // title: Text(
        //   'My Order',
        //   style: TextStyle(color: Colors.black),
        // ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(241, 241, 241, 0.6),
      ),
      body: Container(
        color: Color.fromRGBO(241, 241, 241, 0.6),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 28.0.w),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 241, 241, 0.6),
                    ),
                    child: Text(
                      'My Order',
                      style: TextStyle(
                          // letterSpacing: 0.9,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Times New Roman'),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 241, 241, 0.6),
                  // backgroundBlendMode: BlendMode.difference,
                ),
                child: Padding(
                  padding:  EdgeInsets.all(16.0.sp),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => orderDetails(orderId: ,)));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => orderDetails(
                                            orderId: slug[index],
                                          )));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12.h, top: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: Colors.grey.withOpacity(0.5),
                                    //   spreadRadius: 0.5,
                                    //   blurRadius: 0.5,
                                    //   offset:
                                    //       Offset(0, 2), // changes position of shadow
                                    // ),
                                  ]),
                              child: Padding(
                                padding:  EdgeInsets.all(8.0.sp),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 8.0.w, top: 9.h),
                                          child: Row(
                                            children: [
                                              Text(
                                                ' Order Id: ',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                              Text(
                                                '${orderId[index]}',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                               EdgeInsets.only(right: 6.0.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Rs. ${totalAmount[index]}',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Ubuntu',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 9.0.w, top: 9.h, bottom: 6.h),
                                          child: Text(
                                            'Order Time: ${orderDate[index]} ',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Ubuntu'),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                               EdgeInsets.only(right: 8.0.w),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.history,
                                                color: Colors.red,
                                                size: 10.sp,
                                              ),
                                              Text(
                                                ' ${orderStatus[index]}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: orderId.length,
                      ),
                    
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
   
    );
  }
}
