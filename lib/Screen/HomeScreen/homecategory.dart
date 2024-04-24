import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
// import 'package:uniquesmart/Category/category.dart';
// import '../ProductDetail/proddescnav.dart';
import '../../ProductFetch/categoryapi.dart';
import '../../ProductFetch/fetchcatprod.dart';
import '../../global.dart';

class homeCategory extends StatefulWidget {
  const homeCategory({super.key});

  @override
  State<homeCategory> createState() => homeCategoryState();
}

var selectedCategorySlug;
bool isVisible = false;
final controller = StreamController<List>();

final CategoryApi categoryApi = CategoryApi();

class homeCategoryState extends State<homeCategory> {
  List<CategoryProduct> products = [];
  List<String> title = [];
  List<String> image = [];

  List<String> slug = [];

  awaitfetchapi() async {
    await fetchapidata();
  }

  fetchapidata() async {
    Uri url = Uri.parse('${link}api/categories/${selectedCategorySlug}');
    Response response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);
      // print('abc ${responseData}');
      products = responseData is List
          ? responseData.map((json) => CategoryProduct.fromJson(json)).toList()
          : (responseData['products'] as List)
              .map((json) => CategoryProduct.fromJson(json))
              .toList();
      title = [];
      image = [];
      slug = [];
      for (int i = 0; i < products.length; i++) {
        title.add(products[i].title);
        image.add(products[i].image);
        slug.add(products[i].slug);
        setState(() {});

        //use the stream to pass the data
        controller.add(products);
      }

      try {} catch (e) {
        print(e);
      }
    }
  }

  fetchdata() async {
//fetch category data
    await Provider.of<CategoryApi>(context, listen: false).fetchcategory();
    await categoryApi.fetchcategory();
    print('The length is ${categoryApi.categories.length}');
    // setState(() {

    // });
  }

  @override
  void initState() {
    fetchdata();
    fetchapidata();
    super.initState();
    // fetchCatproducts();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 100,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryApi.categories.length,
                itemBuilder: (BuildContext context, index) {
                  if (categoryApi.categories.length == 0) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        isVisible = !isVisible;
                        //delete all the previous data
                        isVisible == true ? products.clear() : null;

                        setState(() {
                          selectedCategorySlug =
                              categoryApi.categories[index].slug;
                          print(selectedCategorySlug);
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.grey,
                          //       blurRadius: 5,
                          //       offset: Offset(0, 3))
                          // ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    // color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.network(
                                  categoryApi.categories[index].images,
                                  fit: BoxFit.contain,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              categoryApi.categories[index].title,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          FutureBuilder(
            future: fetchapidata(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // return Center(child: CircularProgressIndicator());
              }
              var catproducts = snapshot.data;
              print(catproducts);
              return Visibility(
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => prodcutDesc(
                          //         slug: apiService.products[index].slug),
                          //   ),
                          // );
                        },
                        child: Container(
                          // height: 200,/
                          child: Stack(
                            children: [
                              Container(
                                height: 190,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 19),
                                  child: Container(
                                    child: Image.network(
                                      width: 100,
                                      height: 100,
                                      image[index],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  // child: CircleAvatar(
                                  //   backgroundColor: Colors.white,
                                  //   radius: widget.radius,
                                  //   backgroundImage:
                                  //       NetworkImage(apiService.products[index].image),
                                  // ),
                                ),
                              ),
                              Positioned(
                                top: 120,
                                left: 30,
                                child: Container(
                                  width: 80,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 5),
                                    child: RichText(
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: title[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   top: 140,
                              //   left: 40,
                              //   child: Container(
                              //     width: 200,
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       color: Colors.red,
                              //       borderRadius: BorderRadius.circular(100),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                visible: isVisible,
              );
            },
          ),
      //  StreamBuilder(stream: controller.stream   , builder: (
      //   BuildContext context, AsyncSnapshot<List> snapshot) { 
      //     return Container(
      //       child: Visibility(
      //         visible: isVisible,
      //         child: Container(
      //           //display the products fetched from stream 
                
      //         ),
      //       ),
      //     );
      //   }
      //  )  
      
        ],
      ),
    );
  }
}
