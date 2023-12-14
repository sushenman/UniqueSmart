// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;

// import '../global.dart';
// import 'fetchcatprod.dart';

// class catProdApi extends ChangeNotifier {
// List<CategoryProduct> products = [];

//   initState() {
//     fetchdata();
//   }

//   fetchdata()  async{
  

//     Uri url = Uri.parse('${link}api/categories/battery');
//     Response response = await http.get(url);
//     print(response.statusCode);
//     if(response.statusCode ==200)
//     {
//       dynamic responseData = jsonDecode(response.body);
//       print('abc ${responseData}');
//       notifyListeners();
//       if(responseData is List)
//       {
//         products = responseData.map((json) => CategoryProduct.fromJson(json)).toList();
//         print('cat${products}');
//         notifyListeners();
//       }
//       else if(responseData is Map && responseData.containsKey('products'))
//       {
//         products = (responseData['products'] as List).map((json) => CategoryProduct.fromJson(json)).toList();
//         print('cat${products}');
//         notifyListeners();
//         return products;
//       }
//       else
//       {
//         print('Invalid response format');
//       }
//     }
//     else
//     {
//       print('Api call failed with status code: ${response.statusCode}');
//     }
//   }

// }
