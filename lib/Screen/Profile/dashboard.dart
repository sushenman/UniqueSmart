import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uniquesmart/ProductFetch/dashboardapi.dart';
import 'package:uniquesmart/Provider/authprovider.dart';

import '../Order/orderdetails.dart';

late AuthNotifier authNotifier;

DashboardApi dashboardApi = DashboardApi();

List<String> slug = [];
List<String> orderId = [];
List<String> orderDate = [];
List<String> orderStatus = [];
List<String> totalAmount = [];

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<String> dashTitle = [];
  List<String> dashValue = [];
  @override
  void initState() {
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
      fetchOrder(authNotifier.token);
    });
    super.initState();
  }

  void fetchData() async {
    await dashboardApi.fetchDashApi(authNotifier.token);
    updateLists(); // Call the method to update lists
  }

  void updateLists() {
    setState(() {
      // Clear the lists before updating
      dashTitle.clear();
      dashValue.clear();

      // Add data to the lists
      dashTitle.add('Pending Orders');
      dashValue.add('${dashboardApi.pendingOrders}');

      dashTitle.add('Processing Orders');
      dashValue.add('${dashboardApi.processingOrders}');

      dashTitle.add('Cancelled Orders');
      dashValue.add('${dashboardApi.cancelledOrders}');

      dashTitle.add('Total Orders');
      dashValue.add('${dashboardApi.totalOrders}');
    });
    print(dashTitle);
    print(dashValue);
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
          elevation: 0,
          backgroundColor: Color.fromRGBO(241, 241, 241, 0.8),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 241, 241, 0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 18, left: 18, right: 9),
            child: ListView(
              children: [
                Container(
                  // height: 160,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: dashTitle.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Color.fromARGB(255, 248, 189, 134)),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 25,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${dashValue[index]}',
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '${dashTitle[index]}',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    letterSpacing: 1,
                                    color: Color.fromARGB(189, 111, 111, 111),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(
                            top: 18.0.h, left: 18.w, bottom: 20.h),
                        child: Text(
                          'Recent Order',
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 28.0.w),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          // backgroundBlendMode: BlendMode.difference,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(top: 10.0.h),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => orderDetails()));
                              },
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 0, top: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.5),
                                      //     spreadRadius: 0.5,
                                      //     blurRadius: 0.5,
                                      //     offset:
                                      //         Offset(0, 2), // changes position of shadow
                                      //   ),
                                      // ]
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          left: 8.0.w, right: 8.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(
                                                    left: 8.0.w),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      ' Order Id: ',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        fontSize: 16.sp,
                                                        // fontWeight:
                                                        //     FontWeight.bold
                                                      ),
                                                    ),
                                                    Text(
                                                      ' ${orderId[index]}',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                                    right: 6.0.w),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Rs. ${totalAmount[index]} ',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          fontSize: 14.sp,
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
                                                padding: const EdgeInsets.only(
                                                    left: 9.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Order Time:',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        fontSize: 16.sp,
                                                        // fontWeight:
                                                        //     FontWeight.bold
                                                      ),
                                                    ),
                                                    Text(
                                                      ' ${orderDate[index]}',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 8.0.w),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.history,
                                                      color: Colors.red,
                                                      size: 10,
                                                    ),
                                                    Text(
                                                      '${orderStatus[index]}',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.red,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            color: const Color.fromARGB(
                                                255, 213, 213, 213),
                                            // height: 1,
                                            thickness: 1.2,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: orderId.length  ,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
