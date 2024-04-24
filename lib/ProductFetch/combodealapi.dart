import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:uniquesmart/ProductFetch/fetchbannerdetails.dart';
import 'package:uniquesmart/ProductFetch/fetchcombodeals.dart';

class comboApi extends ChangeNotifier {
  List<fetchcomboDeals> comboo = [];
  List<String> title = [];
  List<String> image = [];
  
  Future<List<fetchcomboDeals>> fetchCombo() async {
    //add the content of brands from api
     String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/packages');

    Map<String, String> headers = {
      'apikey': apiKey,
      'Content-Type': 'application/json',
    };

    Response response = await http.get(url, headers: headers);

    if(response.statusCode==200)
    {
      dynamic responseData = jsonDecode(response.body);
      if(responseData is List)
      {
        comboo = responseData.map((json) => fetchcomboDeals.fromJson(json)).toList();
        notifyListeners();
      }
      else if(responseData is Map && responseData.containsKey('packages'))
      {
        comboo = (responseData['packages'] as List).map((json) => fetchcomboDeals.fromJson(json)).toList();
        notifyListeners();
        return comboo;
      }
      else
      {
        print('Invalid response format');
      }
    }
    else
    {
      print('Api call failed with status code: ${response.statusCode}');
    }
    return comboo;

  }
}
