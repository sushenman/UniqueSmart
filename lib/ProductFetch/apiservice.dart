import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'fetchproduct.dart';
import 'package:uniquesmart/global.dart';
import 'package:flutter/material.dart';
// import 'fetchcategories.dart';


class ApiService extends ChangeNotifier{
  List<Product> products = [];
  bool isLoading = true;
Future<List<Product>> callApiService() async {
  String apiKey = 'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
  Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/products');
  
  Map<String, String> headers = {
    'apikey': apiKey,
    'Content-Type': 'application/json', 
  };

  Response response = await http.get(url, headers: headers);

  print('response ${response.body}');

  if (response.statusCode == 200) {
    dynamic responseData = jsonDecode(response.body);
    notifyListeners();

    if (responseData is List) {
      products = responseData.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } else if (responseData is Map && responseData.containsKey('products')) {
      products = (responseData['products'] as List).map((json) => Product.fromJson(json)).toList();
      notifyListeners();
      return products;
    } else {
      print('Invalid response format');
    }
  } else {
    print('Api call failed with status code: ${response.statusCode}');
  }
  return products;
}

//    Future  callApiService() async {

//     Uri url = Uri.parse('${link}api/products');
//     Response response = await http.get(url);
//     print('respone ${response.body}');
//     if (response.statusCode == 200) {
//       dynamic responseData = jsonDecode(response.body);
// notifyListeners();
//       if (responseData is List) {
//         products = responseData.map((json) => Product.fromJson(json)).toList();
//         // print(products);
//         notifyListeners();
//       } else if (responseData is Map && responseData.containsKey('products')) {
//         products = (responseData['products'] as List).map((json) => Product.fromJson(json)).toList();

        
//           notifyListeners();
//         return products;
//       } else {
//         print('Invalid response format');
//       }
//     } else {
//       print('Api call failed with status code: ${response.statusCode}');
//     }
 
//   }

}
