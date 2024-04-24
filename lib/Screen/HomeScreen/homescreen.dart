import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'package:uniquesmart/ProductFetch/combodealapi.dart';
import 'package:uniquesmart/Screen/HomeScreen/combodealslider.dart';

import 'package:uniquesmart/Screen/HomeScreen/product.dart';
import 'package:uniquesmart/ProductFetch/apiservice.dart';
import 'package:uniquesmart/ProductFetch/categoryapi.dart';

import '../../ProductFetch/brandsapi.dart';
import '../../ProductFetch/bannerapi.dart';
import '../../ProductFetch/fetchcatprod.dart';
// import '../global.dart';
import '../../Provider/authprovider.dart';
import '../navigationbar/bottomnabbar.dart';
import 'allproducts.dart';
import 'ImageSlider.dart';
import 'brands.dart';

import 'homecategory.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ApiService apiService = ApiService();
  List<CategoryProduct> products = [];
  List<String> title = [];
  List<String> image = [];
  List<String> slug = [];
  List<String> price = [];

  List<String> brandTitle = [];
  List<String> brandImage = [];

  List<String> comboTitle = [];
  List<String> comboImage = [];
  List<String> comboSlug = [];

  List<String> imageSliderTitle = [];
  List<String> imageSliderImage = [];

  String selectedCategorySlug = '';
  late AuthNotifier authNotifier;
  int id = 0;
  final CategoryApi categoryApi = CategoryApi();
  @override
  void initState() {
    // fetchapidata();
    super.initState();
    fetchAllData();
    fetchBrandData();
    fetchbannerData();
    fetchComboData();
    // fetchcatdata();
  }

  Future<void> fetchbannerData() async {
    comboDealApi comboApi = Provider.of<comboDealApi>(context, listen: false);
    await comboApi.fetchCombos();

    print('comboDealApi ${comboApi.comboDealL.length}');
    if (comboApi.comboDealL.isNotEmpty) {
      print('comboDealApi ${comboApi.comboDealL.length}');
      print('product ${comboApi.comboDealL[1].title}');
      for (int i = 0; i < comboApi.comboDealL.length; i++) {
      
        imageSliderTitle.add(comboApi.comboDealL[i].title);
        imageSliderImage.add(comboApi.comboDealL[i].image);
        imageSliderTitle.add(comboApi.comboDealL[i].title);
      }
      print('title1 ${title.length}');
      print('image ${image.length}');
    } else {
      print('comboApi.comboDealL is empty');
    }

    print('title ${title.length}');
    print('image ${image.length}');
  }

  Future<void> fetchBrandData() async {
    BrandsApi brandsApi = Provider.of<BrandsApi>(context, listen: false);
    await brandsApi.fetchbrands();
    print('The length is ${brandsApi.BrandL.length}');
    for (int i = 0; i < brandsApi.BrandL.length; i++) {
      brandTitle.add(brandsApi.BrandL[i].title);
      brandImage.add(brandsApi.BrandL[i].image);
    }
    // setState(() {});
  }

  Future<void> fetchAllData() async {
    await Provider.of<ApiService>(context, listen: false).callApiService();
    apiService.callApiService();
    print('api service ${apiService.products.length}');
    // setState(() {});
    if (apiService.products.isNotEmpty) {
      print('api service ${apiService.products.length}');
      print('product ${apiService.products[1].title}');
      for (int i = 0; i < apiService.products.length; i++) {
        title.add(apiService.products[i].title);
        image.add(apiService.products[i].image);
        slug.add(apiService.products[i].slug);
        price.add(apiService.products[i].retailer_price);
      }
      print('title1 ${title.length}');
      print('image ${image.length}');
    } else {
      print('apiService.products is empty');
    }

    print('title ${title.length}');
    print('image ${image.length}');
  }

Future<void> fetchComboData() async {
  comboApi comboAp = Provider.of<comboApi>(context, listen: false);
  await comboAp.fetchCombo();
  print('comboApi ${comboAp.comboo.length}');
  if (comboAp.comboo.isNotEmpty) {
    print('comboApi ${comboAp.comboo.length}');
    print('product ${comboAp.comboo[1].title}');
    for (int i = 0; i < comboAp.comboo.length; i++) {
      comboTitle.add(comboAp.comboo[i].title);
      comboImage.add(comboAp.comboo[i].image);
     comboSlug.add(comboAp.comboo[i].slug);
    }
    print('title1 ${title.length}');
    print('image ${image.length}');
  } else {
    print('comboAp.comboo is empty');
  }
  
}
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    String token = authNotifier.token;
    print('hometoken $token');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height*0. ,
            child: Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<comboDealApi>(
                    builder: (BuildContext, value, child) {
                      return Padding(
                        padding: EdgeInsets.all(0),
                        child: ImageSlider(
                          title: imageSliderTitle,
                          image: imageSliderImage,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 25.w),
                      child: Center(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Popular',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  //Check if the list is empty

                  Consumer<ApiService>(builder: (BuildContext, value, child) {
                    return ProductList(
                        image: 'image',
                        title: 'title',
                        radius: 45,
                        width: 75,
                        height: 100,
                        backgroundColor: 0xFFF24C27,
                        textColor: 0xFFFFFFFF,
                        offerColor: 0X000000);
                  }),
                  SizedBox(
                    height: 30,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Categories',
                  //            style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold, letterSpacing: 1 ),
                  //         textAlign: TextAlign.start,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   // height: 400,
                  //   child: homeCategory()),
                  //   Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //        child:  Consumer<ApiService>(builder: (BuildContext, value, child){
                  //  return
                  //   ProductList(
                  //       image: 'image',
                  //       title: 'title',
                  //       radius: 45,
                  //       width: 75,
                  //       height: 80,
                  //       backgroundColor: 0xFFF24C27,
                  //       textColor: 0xFFFFFFFF,
                  //       offerColor: 0X000000);
                  //   }),
                  //   ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 25.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Combo Deals',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<comboApi>(
                    builder: (BuildContext, value, child) {
                      return Padding(
                        padding: EdgeInsets.all(0),
                        child: comboDeal(
                          title: comboTitle,
                          image: comboImage,
                          slug: comboSlug,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Latest Product',
                  //         style: TextStyle(fontSize: 20),
                  //         textAlign: TextAlign.start,
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  // Consumer<ApiService>(builder: (BuildContext, value, child) {
                  //   return ProductList(
                  //       image: 'image',
                  //       title: 'title',
                  //       radius: 45,
                  //       width: 75,
                  //       height: 80,
                  //       backgroundColor: 0xFFF24C27,
                  //       textColor: 0xFFFFFFFF,
                  //       offerColor: 0X000000);
                  // }),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Our Brands',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(child: Brands(title: brandTitle[], image: brandImage)),
                  Container(
                      height: 120,
                      child: Consumer<BrandsApi>(
                        builder: (BuildContext context, value, child) {
                          return Container(
                            // height: 140,
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                             EdgeInsets.only(left: 22.0.w),
                                        child: Image.network(brandImage[index],
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.contain),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              physics: BouncingScrollPhysics() ,
                              itemCount: brandImage.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          );
                        },
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 25.0.w, bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Our Products',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Consumer<ApiService>(
                        builder: (BuildContext, value, child) {
                      return myProducts(
                        title: 'title',
                        image: 'image',
                        mrp_price: 'price',
                        slug: 'slug',
                        retailer_price: 'price',
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: CustomBottomNavigationBar(
              initialIndex: 0,
            ),
          ),
        ],
      ),
    );
  }
}
