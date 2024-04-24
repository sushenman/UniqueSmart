import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import '../Cart/carthelper.dart';
import '../Login/login.dart';
import '../../Provider/authprovider.dart';
import '../../helper/dbhelper.dart';
import 'OrderComplete.dart';

class Checkout extends StatefulWidget {
   Checkout({super.key, required this.selectedItems});
  final List<Cart> selectedItems;

  @override
  State<Checkout> createState() => CheckoutState();
}

late AuthNotifier authNotifier;
dbhelper _db = dbhelper();
String total = '';

class CheckoutState extends State<Checkout> {
  @override
  void initState() {
    print('${widget.selectedItems}');
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData(authNotifier.token);
    });
    super.initState();
    _db.getCart();
  }

  List<double> qtyprice = [];
  List<int> QtyList = [];
  List<Map<String, dynamic>> products = [];

  String? newValue;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController title = TextEditingController();

  bool isVisible = false;
  Future<void> fetchData(String token) async {
    try {
      Uri url = Uri.parse(
          'https://api.uniquesmartindustries.com/api/shipping-details');
      Response response = await http.get(url, headers: {
        'Authorization': 'Bearer ${token}',
      });
      print(response.statusCode);

//print the response
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final jsonData1 = jsonData as Map<String, dynamic>;

        name.text = jsonData1['detail']['name'];
        email.text = jsonData1['detail']['email'];
        phoneno.text = jsonData1['detail']['phone_number'];
        province.text = jsonData1['detail']['province'];
        zone.text = jsonData1['detail']['zone'];
        district.text = jsonData1['detail']['district'];
        city.text = jsonData1['detail']['city'];
        street.text = jsonData1['detail']['street'];
        title.text = jsonData1['detail']['title'];
        setState(() {});
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during API call: $e ');
    }
  }

 
  Future<void> placeOrder(String token) async {
    try {
      Uri url =
          Uri.parse('https://api.uniquesmartindustries.com/api/checkouts');

      // Extract the required data from the controllers
      Map<String, dynamic> orderData = {
        "name": name.text,
        "email": email.text,
        "phone_number": phoneno.text,
        "state": province.text,
        // "province": province.text,
        "zone": zone.text,
        "district": district.text,
        "city": city.text,
        "street": street.text,
        "total": total,
        "total_items": widget.selectedItems.length,
        "remarks": "",
        // selectedItem.data![index].quantity
        "products": widget.selectedItems
            .map((item) => {
                  "slug": item.slug,
                  "product_name": item.title,
                  "quantity": item.quantity,
                  "price": item.price.replaceAll(',', ''),
                })
            .toList(),
      };

      print('Order Data = $orderData');
      Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 200) {
        // Order placed successfully, you can handle the response as needed
        print(response.body);

        print('Order placed successfully');
      } else {
        print('Failed to place order. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during API call: $e');
    }
  }

  double calculateTotalPrice(List<String> productPrice) {
    double totalprice = 0;
    for (int i = 0; i < productPrice.length; i++) {
      try {
        double parsedDouble = double.parse(productPrice[i].replaceAll(',', ''));
        totalprice = qtyprice[i] + totalprice;
        print(totalprice);
      } catch (e) {}
    }
    return totalprice;
  }

                          
                        
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    String token = authNotifier.token;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: 
            // Remove the FutureBuilder for fetching cart items
        // Use widget.selectedItems instead of selectedItems.data
        widget.selectedItems.isNotEmpty ?
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
        String numberWithNoComma = widget.selectedItems[index].price.replaceAll(',', '');
        total = (double.parse(numberWithNoComma) * double.parse(widget.selectedItems[index].quantity)).toString();
        qtyprice.add(double.parse(numberWithNoComma) * double.parse(widget.selectedItems[index].quantity));
            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255),
        
                                    // color: Colors.grey[300],
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(0, 2))
                                    ]),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            // decoration: BoxDecoration(
                                            //   color: Colors.white
                                            // ) ,
                                            width: 100,
                                            height: 120,
                                            child: Image.network(
                                                widget.selectedItems[index].image,),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0, left: 10),
                                                child: Text(
                                                 widget.selectedItems[index].title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // width: 50 ,
                                                  // color: Colors.amber,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 10),
                                                    child: Text(
                                                        'Qty: ${widget.selectedItems[index].quantity}',
                                                        style: TextStyle(
                                                            color: Colors.black)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 90,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10.0, left: 10),
                                                  child: Text(
                                                    'Rs ${qtyprice[index]}',
                                                    style: TextStyle(
                                                        color:
                                                            const Color.fromARGB(
                                                                255, 255, 0, 0),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                 
            },
            itemCount: widget.selectedItems.length,
          ) : Container()
        
              ),
        
              //Delivery Location Container
        
              //Order Summary Container
              if (widget.selectedItems.length > 0)
                FutureBuilder(
                  builder: (BuildContext context, selectedItems) {
                    List<String> productPrice = [];
                    if (selectedItems.data != null) {
                      for (int i = 0; i < selectedItems.data!.length; i++) {
                        productPrice.add(selectedItems.data![i].price);
                      }
                    }
        
                    double totalprice = calculateTotalPrice(productPrice);
        
                    return Padding(
                      padding:  EdgeInsets.all(18.0.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey[300]
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(16.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Rs ${totalprice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  future: _db.getCart(),
                ),
        
              if (widget.selectedItems.length > 0)
                Padding(
                  padding:  EdgeInsets.all(18.0.sp),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255)),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(20.0.sp),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shipping Details',
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                AnimatedCrossFade(
                                  firstChild: Icon(
                                    Icons.arrow_circle_up_sharp,
                                    size: 24,
                                  ),
                                  secondChild: Icon(
                                    Icons.arrow_circle_down_sharp,
                                    size: 24,
                                  ),
                                  crossFadeState: isVisible
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: Duration(milliseconds: 500),
                                )
                                // Icon(
                                //     isVisible ? Icons.arrow_circle_up_sharp : Icons.arrow_circle_down_sharp,
                                //   )
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: isVisible,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Full Name',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    // width: 50,
        
                                    height: 30,
                                    child: TextField(
                                      controller: name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width*0.4,
                                    height: 30,
                                    child: TextField(
                                      controller: email,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      'Phone Number',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    // width: MediaQuery.of(context).size.width*0.4,
                                    child: TextField(
                                      controller: phoneno,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      'Province',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    // width: MediaQuery.of(context).size.width*0.4,
                                    child: TextField(
                                      controller: province,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      'Zone',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: TextField(
                                      controller: zone,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Text(
                                      'City',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: TextField(
                                      controller: city,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      'Street Address',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: TextField(
                                      controller: street,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      'Title',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: TextField(
                                      controller: title,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              if (widget.selectedItems.length > 0)
                ElevatedButton(
                  onPressed: () {
                    token.isEmpty
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()))
                        : name.text.isEmpty ||
                                email.text.isEmpty ||
                                phoneno.text.isEmpty ||
                                province.text.isEmpty ||
                                zone.text.isEmpty ||
                                district.text.isEmpty ||
                                city.text.isEmpty ||
                                street.text.isEmpty ||
                                title.text.isEmpty
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please fill all the fields')))
                            : placeOrder(authNotifier
                                .token); // Call the placeOrder function
                  },
                  child:
                      Text('Place Order', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.h)),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(242, 76, 39, 1))),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// void doNothing(BuildContext context) {
//   //DELETE THE ITEM FROM THE DATABASE
// }
