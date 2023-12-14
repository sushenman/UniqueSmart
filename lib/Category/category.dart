import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/ProductFetch/categoryapi.dart';
import 'package:uniquesmart/ProductFetch/fetchcategories.dart';
import 'package:uniquesmart/Category/categoryProducts.dart';

import 'categoryproductnav.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

int selectedCategoryIndex = -1;

final CategoryApi categoryApi = CategoryApi();

class _CategoriesState extends State<Categories> {
  Future<void> fetchapidata() async {
    await Provider.of<CategoryApi>(context, listen: false).fetchcategory();
    await categoryApi.fetchcategory();
    print('The length is ${categoryApi.categories.length}');
    setState(() {
      
    });
  }

  @override
  void initState() {
    fetchapidata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SizedBox(height: 30),
          Container(
            width: 100,
            // height: MediaQuery.of(context).size.height ,
            child: Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                      if(categoryApi.categories[index].subCategory.length == 0)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => categoryProductDrawer(slug: categoryApi.categories[index].slug,) ));
                      }
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: selectedCategoryIndex == index
                              ? Color.fromRGBO(242, 76, 39, 1)
                              : Color.fromARGB(255, 226, 226, 226),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width: 60,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Image.network(
                                    categoryApi.categories[index].images),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  categoryApi.categories[index].title,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: categoryApi.categories.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // physics: ScrollPhysics(),
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: selectedCategoryIndex != -1
                  ? CategoryWidget(
                      categoryTitle:
                          categoryApi.categories[selectedCategoryIndex].title,
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatefulWidget {
  final String categoryTitle;
  const CategoryWidget({required this.categoryTitle, super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}
class _CategoryWidgetState extends State<CategoryWidget> {
  Map<int, String?> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(
  color: Color.fromARGB(255, 210, 210, 210)
) ,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              if (categoryApi.categories
                      .firstWhere((cat) => cat.title == widget.categoryTitle)
                      .subCategory[index]
                      .childCategory
                      .length >
                  0) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Child Category'),
                      content: Container(
                        height: 100,
                        width: 200,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int innerIndex) {
                            final childCategory = categoryApi.categories
                                .firstWhere((cat) =>
                                    cat.title == widget.categoryTitle)
                                .subCategory[index]
                                .childCategory[innerIndex];

                            return ListTile(
                              title: Text(childCategory.title),
                              onTap: () {
                                // Handle child category selection
                                try{
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => categoryProductDrawer(slug: childCategory.slug )));
print('abc');
                                }
                                catch(e)

                                {
                                print(e);  
                                }

                              },
                            );
                          },
                          itemCount: categoryApi.categories
                              .firstWhere((cat) => cat.title == widget.categoryTitle)
                              .subCategory[index]
                              .childCategory
                              .length,
                        ),
                      ),
                    );
                  },
                );
              } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => categoryProductDrawer(slug: categoryApi.categories
                              .firstWhere((cat) => cat.title == widget.categoryTitle)
                              .subCategory[index].slug,) ));
              }
            },
            child: Container( 
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(255, 255, 255, 255),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: categoryApi.categories
                                    .firstWhere((cat) =>
                                        cat.title == widget.categoryTitle)
                                    .subCategory[index]
                                    .images ==
                                null
                            ? Container()
                            : Image.network(
                                categoryApi.categories
                                    .firstWhere((cat) =>
                                        cat.title == widget.categoryTitle)
                                    .subCategory[index]
                                    .images!,
                              ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        // width: 100,
                        // height: 00,
                        child: Text(
                          categoryApi.categories
                              .firstWhere(
                                  (cat) => cat.title == widget.categoryTitle)
                              .subCategory[index]
                              .title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: categoryApi.categories
            .firstWhere((cat) => cat.title == widget.categoryTitle)
            .subCategory
            .length,
      ),
    );
  }
}
