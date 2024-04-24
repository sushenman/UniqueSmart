import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:uniquesmart/ProductFetch/fetchbannerdetails.dart';

class comboDealApi extends ChangeNotifier {
  List<fetchBannerDetails> comboDealL = [];
  List<String> title = [];
  List<String> image = [];
  
  Future<List<fetchBannerDetails>> fetchCombos() async {
    //add the content of brands from api
     String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/banners');

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
        comboDealL = responseData.map((json) => fetchBannerDetails.fromJson(json)).toList();
        notifyListeners();
      }
      else if(responseData is Map && responseData.containsKey('banners'))
      {
        comboDealL = (responseData['banners'] as List).map((json) => fetchBannerDetails.fromJson(json)).toList();
        notifyListeners();
        return comboDealL;
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
    return comboDealL;

  }
}
