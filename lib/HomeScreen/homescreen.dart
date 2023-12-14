import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uniquesmart/HomeScreen/combodealslider.dart';
import 'package:uniquesmart/HomeScreen/product.dart';
import 'package:uniquesmart/ProductFetch/apiservice.dart';
import 'package:uniquesmart/ProductFetch/fetchproduct.dart';
import 'allproducts.dart';
import 'ImageSlider.dart';
import 'brands.dart';
import 'dart:convert';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Make initState asynchronous
    fetchAllData();
  }

  // Make fetchAllData asynchronous and return the list
  Future<void> fetchAllData() async {
    await Provider.of<ApiService>(context, listen: false).callApiService();
    await apiService.callApiService();
    // setState(() {

    // });
  }

  @override
  Widget build(BuildContext context) {
    
    // TextEditingController SearchController = TextEditingController();
    // ScrollController scrollController = ScrollController();
    // List<String> list = [
    //   "UPS Router Backup 12v",
    //   "Bravo home UPS 5200 VA + Tabular Battery 220Ah/48V C20",
    //   "Savior PWN 50A/120V",
    //   "Superb solar pcu 2500",
    //   "Solar PCU Smarten Saver Series 6000"
    // ];

    // List<String> imageList = [
    //   "assets/images/0.jpg",
    //   "assets/images/1.jpg",
    //   "assets/images/2.jpg",
    //   "assets/images/3.jpg",
    //   "assets/images/4.jpg"
    // ];
    // List<String> options = [
    //   'Flash Sale',
    //   'New Arrivals',
    //   'Best Seller',
    //   'Categories',
    //   'Support'
    // ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:  ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 5),
                  child: ImageSlider(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Center(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              Consumer<ApiService>(builder: (BuildContext, value, child){ 
               return    
                ProductList(
                    image: 'image',
                    title: 'title',
                    radius: 45,
                    width: 75,
                    height: 80,
                    backgroundColor: 0xFFF24C27,
                    textColor: 0xFFFFFFFF,
                    offerColor: 0X000000);
                }),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Limited Time Deals',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                     child:  Consumer<ApiService>(builder: (BuildContext, value, child){ 
               return    
                ProductList(
                    image: 'image',
                    title: 'title',
                    radius: 45,
                    width: 75,
                    height: 80,
                    backgroundColor: 0xFFF24C27,
                    textColor: 0xFFFFFFFF,
                    offerColor: 0X000000);
                }),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Combo Deals',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: comboDeal(),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Latest Product',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     shrinkWrap: true,

                //     scrollDirection: Axis.horizontal ,
                //     itemCount: listproducts.length ,
                //     itemBuilder: (BuildContext context, index) {
                //       return Container(
                //         child: Text('data'),
                //       );
                //     },
                //   ),
                // ),
                Consumer<ApiService>(builder: (BuildContext, value, child){ 
               return    
                ProductList(
                    image: 'image',
                    title: 'title',
                    radius: 45,
                    width: 75,
                    height: 80,
                    backgroundColor: 0xFFF24C27,
                    textColor: 0xFFFFFFFF,
                    offerColor: 0X000000);
                }),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Our Brands',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(child: Brands()),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Our Products',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Consumer<ApiService>(builder: (BuildContext, value, child){ 
                   

                 return myProducts( title: 'title', image: 'image', price: 'price', slug: 'slug' );
                  }
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
      ),);
  }
}