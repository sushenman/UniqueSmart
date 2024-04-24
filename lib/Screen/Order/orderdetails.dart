import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/Order/order.dart';

import '../../Provider/authprovider.dart';

class orderDetails extends StatefulWidget {
  final String orderId;
  const orderDetails({super.key, required this.orderId});
  @override
  State<orderDetails> createState() => _orderDetailsState();
}

late AuthNotifier authNotifier;

class _orderDetailsState extends State<orderDetails> {
  String slug = '';
  String orderId = '';
  String orderDate = '';
  String orderStatus = '';
  String StringtotalAmount = '';
  String customerName = '';
  String customerPhone = '';
  String customerAddress = '';
  List<Map<String, dynamic>> orderItems = [];

  @override
  void initState() {
    print(widget.orderId);
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchOrderDetails(authNotifier.token);
    });
    super.initState();
  }

  Future<void> fetchOrderDetails(String token) async {
    Uri url = Uri.parse(
        'https://api.uniquesmartindustries.com/api/orders/${widget.orderId}');
    Response response = await http.get(url, headers: {
      'Authorization': 'Bearer ${token}',
    });
    if (response.statusCode == 200) {
      //store the response in a variable
      final jsonData = json.decode(response.body);
      print(jsonData);
      final jsonData1 = jsonData as Map<String, dynamic>;
      print(jsonData1);

      slug = jsonData1['order'][0]['slug'].toString();
      orderId = jsonData1['order'][0]['order_id'].toString();
      orderDate = jsonData1['order'][0]['order_date'].toString();
      orderStatus = jsonData1['order'][0]['status'].toString();
      StringtotalAmount = jsonData1['order'][0]['total_amount'].toString();
      customerName = jsonData1['order'][0]['customer_name'].toString();
      customerPhone = jsonData1['order'][0]['customer_phone'].toString();
      customerAddress = jsonData1['order'][0]['customer_address'].toString();

// For items, which is a list of maps
      orderItems =
          List<Map<String, dynamic>>.from(jsonData1['order'][0]['items']);
// print(' total =  ${orderItems[1]['amount']}');
      setState(() {});
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            // Navigator.pop(context);
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
          backgroundColor: Color.fromRGBO(241, 241, 241, 0.8),
        ),
        body: Container(
          color: Color.fromRGBO(239, 239, 239, 0.8),
          child: Padding(
            padding: EdgeInsets.only(
                top: 28.0.h, left: 20.w, right: 20.w, bottom: 40.h),
            child: Container(
              // constraints: BoxConstraints() ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  // shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' ORDER ID',
                          style: TextStyle(
                              // letterSpacing: 3,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Text(
                          ' ORDER DATE',
                          style: TextStyle(
                              // letterSpacing: 3,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$orderId',
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 16.sp,
                              // fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Text(
                          '$orderDate',
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Name: $customerName',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16.sp,
                          // fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'ITEMS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            fontSize: 16.sp),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: orderItems.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              // decoration: BoxDecoration(
                              //   color: Colors.transparent,
                              // ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 0.0, top: 0),
                                  child: Card(
                                    color: const Color.fromARGB(0, 209, 89, 89),
                                    elevation: 0,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          // leading: CircleAvatar(
                                          //   radius: 30,
                                          //   backgroundImage: AssetImage(
                                          //       'assets/images/1.jpg'),
                                          // ),
                                          title: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.0.h),
                                            child: Text(
                                              '${orderItems[index]['product_name']}',
                                              style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Quantity: ${orderItems[0]['quantity']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          ),
                                          trailing: Text(
                                            'Rs ${orderItems[0]['amount']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Card(
                      elevation: 0,
                      child: ListTile(
                        trailing: Container(
                            // width: 130,
                            child: Text(
                          'Total   Rs ${StringtotalAmount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
