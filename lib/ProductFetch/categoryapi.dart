
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../global.dart';
import 'fetchcategories.dart';


class CategoryApi extends ChangeNotifier{
  List<Category> categories = [];

//  initState(){
//   fetchcategory();
// }

  fetchcategory() async {
   

    Uri url = Uri.parse('${link}api/categories');
    Response response = await http.get(url);
  print(response.statusCode);
    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);
      print('abc ${responseData}');
      notifyListeners();
      if (responseData is List) {
        categories = responseData.map((json) => Category.fromJson(json)).toList();
        print('cat${categories}');
        notifyListeners();
      } else if (responseData is Map && responseData.containsKey('categories')) {
        categories = (responseData['categories'] as List).map((json) => Category.fromJson(json)).toList();
        print('cat${categories}');
        
          notifyListeners();
        return categories;
      } else {
        print('Invalid response format');
      }
    } else {
      print('Api call failed with status code: ${response.statusCode}');
    }
   
   
}
}