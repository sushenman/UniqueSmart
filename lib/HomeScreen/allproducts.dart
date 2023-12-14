import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ProductDetail/productdesc.dart';
import '../ProductFetch/apiservice.dart';
import '../ProductFetch/fetchproduct.dart';

class myProducts extends StatefulWidget {
  //get the api data through constructor

  final String title; 
  final String image;
  final String price;
  final String slug;




  const myProducts({Key? key, required this.title, required this.image, required this.price, required this.slug}) : super(key: key);

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
  Widget build (BuildContext context) {
    return Consumer<ApiService>(builder: (BuildContext, value, child){
      return Container(
            
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount:
                    2, // Adjust the cross-axis count based on your needs
                childAspectRatio: 0.7,
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
                              builder: (context) => productDescription(
                                  slug: value.products[index].slug),
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
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Center(
                                    child: Image.network(
                                      value.products[index].image,
                                      width: 200,
                                      height: 150,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.products[index].title
                                              .toString(),
                                        ),
                                        Text(''),
                                        Text(
                                          'Rs ' +
                                              value.products[index].price
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(''),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('View Details'),
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
                ))
      );
    }  ); 
  }
}