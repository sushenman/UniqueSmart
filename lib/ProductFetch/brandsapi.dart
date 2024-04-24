import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniquesmart/ProductFetch/fetchbrandlist.dart';
import 'package:http/http.dart' as http;

class BrandsApi extends ChangeNotifier {
  List<BrandsList> BrandL = [];
  List<String> title = [];
  List<String> image = [];

  Future<List<BrandsList>> fetchbrands() async {
    //add the content of brands from api
    String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/brands');

    Map<String, String> headers = {
      'apikey': apiKey,
      'Content-Type': 'application/json',
    };

    Response response = await http.get(url, headers: headers);

    print('response ${response.body}');
    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);
      if (responseData is List) {
        BrandL = responseData.map((json) => BrandsList.fromJson(json)).toList();

        notifyListeners();
      } else if (responseData is Map && responseData.containsKey('brands')) {
        BrandL = (responseData['brands'] as List)
            .map((json) => BrandsList.fromJson(json))
            .toList();
        notifyListeners();
        return BrandL;
      } else {
        print('Invalid response format');
      }
    } else {
      print('Api call failed with status code: ${response.statusCode}');
    }
    //add the content of brands from api

    return BrandL;
  }
}
