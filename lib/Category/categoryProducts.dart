import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uniquesmart/ProductDetail/productdesc.dart';
import 'package:uniquesmart/ProductFetch/apiservice.dart';
// import 'package:uniquesmart/ProductFetch/categoryapi.dart';

// import '../HomeScreen/allproducts.dart';
// import '../HomeScreen/homescreen.dart';
import 'package:badges/badges.dart' as badges;

// import '../ProductFetch/fetchproduct.dart';
import '../ProductFetch/categoryproductlistapi.dart';
import '../ProductFetch/fetchcatprod.dart';
import '../global.dart';

class categoryProducts extends StatefulWidget {
  const categoryProducts({super.key, required this.slug});
  final String slug;
  @override
  State<categoryProducts> createState() => _categoryProductsState();
}

class _categoryProductsState extends State<categoryProducts> {
  List<CategoryProduct> products = [];
  List<String> title = [];
  List<String> image = [];
  List<String> mrpPrice = [];
  List<String> retailer_price = [];
  List<String> slug = [];
  int id = 0;
  @override
  void initState() {
    super.initState();
    // fetchproducts();
    fetchdata();
  }

  fetchdata() async {
    Uri url = Uri.parse('${link}api/categories/${widget.slug}');
    Response response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);
      // print('abc ${responseData}');

      if (responseData is List) {
        products =
            responseData.map((json) => CategoryProduct.fromJson(json)).toList();
        // print('cat${products}');
        print('cat${products[0].title}');
        return products;
      } else if (responseData is Map && responseData.containsKey('products')) {
        products = (responseData['products'] as List)
            .map((json) => CategoryProduct.fromJson(json))
            .toList();
        // print('cat${products}');
        //  print('cat${products[0].title}');
        setState(() {});
        for (int i = 0; i < products.length; i++) {
          title.add(products[i].title);
          image.add(products[i].image);
          mrpPrice.add(products[i].mrpPrice);
          retailer_price.add(products[i].retailer_price);
          slug.add(products[i].slug);
        }
        print(responseData['category']['id']);
        id = responseData['category']['id'];

        return products;
      } else {
        print('Invalid response format');
      }
    } else {
      print('Api call failed with status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                ),
              ],
            ),
            products.length > 0
                ? Container(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${products.length.toString()} Products found',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: 135,
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black),
                                  // color: Colors.amber,

                                  ),
                              child: DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    child: Text('ASC'),
                                    value: 'Alphabet Ascending',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('DESC'),
                                    value: 'Alphabet Descending',
                                  ),
                                ] //display the selected value in the ui otherwise by default the first value will be displayed

                                ,
                                onChanged: (items) {
                                  setState(() {});

                                  if (items == 'Alphabet Ascending') {
                                    //clear the items list
                                    // products.clear();
                                    print('id ${id}');

                                    Uri url1 = Uri.parse(
                                        '${link}api/categories/${widget.slug}?category=${id}&sort=asc');
                                    http.get(url1).then((response) {
                                      print(response.statusCode);
                                      if (response.statusCode == 200) {
                                        dynamic responseData =
                                            jsonDecode(response.body);
                                        print('abc ${responseData}');

                                        if (responseData is List) {
                                          products = responseData
                                              .map((json) =>
                                                  CategoryProduct.fromJson(
                                                      json))
                                              .toList();
                                          print('cat${products}');
                                          setState(() {});
                                          return products;
                                        } else if (responseData is Map &&
                                            responseData
                                                .containsKey('products')) {
                                          products =
                                              (responseData['products'] as List)
                                                  .map((json) =>
                                                      CategoryProduct.fromJson(
                                                          json))
                                                  .toList();
                                          print('cat${products}');
                                          setState(() {});
                                          title.clear();
                                          image.clear();
                                          mrpPrice.clear();
                                          retailer_price.clear();
                                          slug.clear();

                                          for (int i = 0;
                                              i < products.length;
                                              i++) {
                                            title.add(products[i].title);
                                            image.add(products[i].image);
                                            mrpPrice.add(products[i].mrpPrice);
                                            retailer_price.add(
                                                products[i].retailer_price);
                                            slug.add(products[i].slug);
                                          }
                                          return products;
                                        } else {
                                          print('Invalid response format');
                                        }
                                      } else {
                                        print(
                                            'Api call failed with status code: ${response.statusCode}');
                                      }
                                    });
                                    //sort the list in ascending order
                                    //call another api to get the sorted lsit
                                    //and add it to the items list
                                  } else if (items == 'Alphabet Descending') {
                                    Uri url1 = Uri.parse(
                                        '${link}api/categories/${widget.slug}?category=${id}&sort=desc');
                                    http.get(url1).then((response) {
                                      print(response.statusCode);
                                      if (response.statusCode == 200) {
                                        dynamic responseData =
                                            jsonDecode(response.body);
                                        print('abc ${responseData}');

                                        if (responseData is List) {
                                          products = responseData
                                              .map((json) =>
                                                  CategoryProduct.fromJson(
                                                      json))
                                              .toList();
                                          print('cat${products}');
                                          setState(() {});
                                          return products;
                                        } else if (responseData is Map &&
                                            responseData
                                                .containsKey('products')) {
                                          products =
                                              (responseData['products'] as List)
                                                  .map((json) =>
                                                      CategoryProduct.fromJson(
                                                          json))
                                                  .toList();
                                          print('cat${products}');
                                          setState(() {});
                                          title.clear();
                                          image.clear();
                                          mrpPrice.clear();
                                          retailer_price.clear();
                                          slug.clear();
                                          
                                          for (int i = 0;
                                              i < products.length;
                                              i++) {
                                            title.add(products[i].title);
                                            image.add(products[i].image);
                                            mrpPrice.add(products[i].mrpPrice);
                                            retailer_price.add(
                                                products[i].retailer_price);
                                            slug.add(products[i].slug);
                                          }
                                          return products;
                                        } else {
                                          print('Invalid response format');
                                        }
                                      } else {
                                        print(
                                            'Api call failed with status code: ${response.statusCode}');
                                      }
                                    });
                                  }
                                },
                                hint: Text('Filter by          '),
                                padding: EdgeInsets.zero,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(''),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 1.6 / 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                        itemCount: products.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            productDescription(
                                                slug: products[index].slug)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    // color: Color.fromARGB(255, 236, 236, 236),
                                    border: Border.all(
                                        color: Color.fromARGB(137, 190, 188, 188))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Center(
                                              child: Image.network(
                                            products[index].image,
                                            width: 100,
                                            height: 120,
                                            fit: BoxFit.contain,
                                          )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(products[index].title),
                                                Text(''),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Padding(
                                                    //     padding:
                                                    //         const EdgeInsets.only(
                                                    //             right: 12.0),
                                                    //     child: Ink(
                                                    //         // color: Colors.red,
                                                    //         child: IconButton(
                                                    //       padding:
                                                    //           EdgeInsets.zero,
                                                    //       constraints:
                                                    //           BoxConstraints(),
                                                    //       onPressed: () {
                                                    //         setState(() {
                                                    //           isFavoriteList[
                                                    //                   index] =
                                                    //               !isFavoriteList[
                                                    //                   index];
                                                    //         });
                                                    //       },
                                                    //       icon: Padding(
                                                    //         padding:
                                                    //             const EdgeInsets
                                                    //                 .all(0.0),
                                                    //         child: isFavoriteList[
                                                    //                     index] ==
                                                    //                 false
                                                    //             ? Icon(Icons
                                                    //                 .favorite_border)
                                                    //             : Icon(Icons
                                                    //                 .favorite),
                                                    //         // icon: Icon(
                                                    //         //   Icons.favorite_border,
                                                    //         //   color: Colors.black,
                                                    //         // )
                                                    //       ),
                                                    //     )))
                                                  ],
                                                ),
                                                Text(
                                                  'Rs ${products[index].mrpPrice}',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                Text(''),
                                                Text(
                                                    'Rs ${products[index].retailer_price}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(''),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
                  )
                : Container(
                    //create a loading skeleton container

                    //
                    ),
          ]),
        ),
      ),
    );
  }
}
