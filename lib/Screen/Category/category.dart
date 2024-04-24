import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uniquesmart/ProductFetch/categoryapi.dart';
import 'package:uniquesmart/ProductFetch/fetchcategories.dart';
import 'package:uniquesmart/Screen/Category/categoryProducts.dart';
import 'package:uniquesmart/Screen/navigationbar/bottomnabbar.dart';

import 'categoryproductnav.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

String? categoryName;
int selectedCategoryIndex = -1;
bool isVisible = false;

final CategoryApi categoryApi = CategoryApi();

class _CategoriesState extends State<Categories> {
  fetchapidata() async {
    try {
      await Provider.of<CategoryApi>(context, listen: false).fetchcategory();
      await categoryApi.fetchcategory();
      print('The length is ${categoryApi.categories.length}');
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  List<Map<String, dynamic>> products = [];

fetchCategoriesproducts() async {
  try {
    Uri url = Uri.parse(
        'https://api.uniquesmartindustries.com/api/categories/$categoryName/filter');
    Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'apikey':
          'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB'
    });
    List subCategory = [];
    dynamic responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      products.clear();
      for (var item in responseData['categories']) {
        if (categoryName == item['slug']) {
          subCategory = item['subCategory'];
          if (subCategory.isEmpty) {
            // Handle navigation here or set a flag to navigate later
        
            Navigator.push(context, MaterialPageRoute(builder: (context) => categoryProductDrawer(slug: item['slug'] )));
          } else {
            for (var sub in subCategory) {
              Map<String, dynamic> subProducts = {
                'slug': sub['slug'],
                'title': sub['title'],
                'images': sub['image'],
              };
              setState(() {
                products.add(subProducts);
              });
            }
          }
        }
      }
    } else {
      print('Failed to fetch categories');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    fetchapidata();
    super.initState();
  }

  Color color = Color.fromARGB(255, 226, 226, 226);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: Container(
                  child: SingleChildScrollView(
                child: ListView.builder(
                    itemCount: categoryApi.categories.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                          // width: 10,
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          // decoration: BoxDecoration(
                          //   color: Colors.amber
                          // ),
                          color: selectedCategoryIndex == index
                              ? Color.fromARGB(255, 230, 99, 11)
                              : color,
                          height: 100.h,
                          child: ListTile(
                            minVerticalPadding: 10.w,
                            onTap: () {
                              setState(() {
                                // selectedCategoryIndex = index;
                                selectedCategoryIndex = index;
                                //change the color of the selected category
              
                                categoryName = categoryApi.categories[index].slug;
                              });
                              fetchCategoriesproducts();
                              print(categoryName);
                              print(categoryApi.categories[index].subCategory.length);
                            },
                            title: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 255, 255, 255),
                              radius: 25.w,
                              child: Image.network(
                                '${categoryApi.categories[index].images}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            subtitle: Padding(
                              padding:  EdgeInsets.only(top :8.0.sp),
                              child: Text(
                                categoryApi.categories[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'Poppins',
                                  color: selectedCategoryIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ));
                    }),
              )),
            ),
          ),
          Flexible(
              flex: 4,
              child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 40,
                    ),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, index) {
                      return Visibility(
                          child: Container(
                              child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => categoryProductDrawer(
                                      slug: products[index]['slug']))),
                          title: Image.network(
                            '${products[index]['images']}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          subtitle: Center(
                              child: Text('${products[index]['title']}', style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                color: Colors.black
                              ),)),
                        ),
                      )));
                    }),
              ))
        ],
      ),
    );
  }
}
  // @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Expanded(
//           child: Row(
//             children: [
//               // SizedBox(height: 30),
//               Container(
//                 width: 100,
//                 child: Expanded(
//                   child: ListView.builder(
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedCategoryIndex = index;
//                           });
//                           if (categoryApi
//                                   .categories[index].subCategory.length ==
//                               0) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => categoryProductDrawer(
//                                           slug: categoryApi
//                                               .categories[index].slug,
//                                         )));
//                           }
//                         },
//                         child: SingleChildScrollView(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.3,
//                             decoration: BoxDecoration(
//                               color: selectedCategoryIndex == index
//                                   ? Color.fromRGBO(242, 76, 39, 1)
//                                   : Color.fromARGB(255, 226, 226, 226),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 10.0),
//                                   child: Container(
//                                     width: 60,
//                                     height: 80,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         shape: BoxShape.circle),
//                                     child: Image.network(
//                                         categoryApi.categories[index].images),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       categoryApi.categories[index].title,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily: 'Poppins',
//                                         color: selectedCategoryIndex == index
//                                             ? Colors.white
//                                             : Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: categoryApi.categories.length,
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     // physics: ScrollPhysics(),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 30),
//               Expanded(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: selectedCategoryIndex != -1
//                       ? CategoryWidget(
//                           categoryTitle: categoryApi
//                               .categories[selectedCategoryIndex].title,
//                         )
//                       : Container(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Center(
//             child: CustomBottomNavigationBar(
//           initialIndex: 1,
//         )),
//       ]),
//     );
//   }
// }

// class CategoryWidget extends StatefulWidget {
//   final String categoryTitle;
//   const CategoryWidget({required this.categoryTitle, super.key});

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {
//   Map<int, String?> selectedValues = {};

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Color.fromARGB(255, 210, 210, 210)),
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 2,
//           mainAxisSpacing: 2,
//         ),
//         itemBuilder: (BuildContext context, index) {
//           return GestureDetector(
//             onTap: () {
//               print(categoryApi.categories
//                                   .firstWhere((cat) =>
//                                       cat.title == widget.categoryTitle)
//                                   .subCategory[index]
//                                   .slug);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => categoryProductDrawer(
//                               slug: categoryApi.categories
//                                   .firstWhere((cat) =>
//                                       cat.title == widget.categoryTitle)
//                                   .subCategory[index]
//                                   .slug,
//                             )));
//               },
          
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 // borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12.0, bottom: 8),
//                   ),
//                   Container(
//                     // decoration: BoxDecoration(
//                     //   color: Color.fromARGB(255, 255, 255, 255),
//                     //   borderRadius: BorderRadius.circular(10),
//                     // ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         child: categoryApi.categories
//                                     .firstWhere((cat) =>
//                                         cat.title == widget.categoryTitle)
//                                     .subCategory[index]
//                                     .images ==
//                                 null
//                             ? Container()
//                             : Image.network(
//                                 categoryApi.categories
//                                     .firstWhere((cat) =>
//                                         cat.title == widget.categoryTitle)
//                                     .subCategory[index]
//                                     .images!,
//                               ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     // height: 100,
//                     child: Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: Container(
//                         // width: 100,
//                         // height: 00,
//                         child: Text(
//                             categoryApi.categories
//                                 .firstWhere(
//                                     (cat) => cat.title == widget.categoryTitle)
//                                 .subCategory[index]
//                                 .title,
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 14,
//                               color: Colors.black,
//                             )),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: categoryApi.categories
//             .firstWhere((cat) => cat.title == widget.categoryTitle)
//             .subCategory
//             .length,
//       ),
//     );
//   }
// }
