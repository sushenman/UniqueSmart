import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:uniquesmart/Provider/authprovider.dart';

late AuthNotifier authNotifier;



class DashboardApi extends ChangeNotifier{
    var pendingOrders;
    var processingOrders;
    var cancelledOrders;
    var totalOrders;
  dynamic responseData;
  fetchDashApi(String token) async{

    try{
      Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/dashboard');
      Response response = await http.get(url, headers: {
        'Authorization' : 'Bearer $token'
      }, 
       );
      print('respone ${response.body}');

      if (response.statusCode == 200) {
         responseData = jsonDecode(response.body);

         print('responseData = $responseData');
        // print('${responseData}');
        // print('${responseData["pendingOrders"]}');
        // print(response.body.runtimeType);
        pendingOrders = responseData['orders']['pendingOrders'];
        processingOrders = responseData['orders']['processingOrders'];
        cancelledOrders = responseData['orders']['cancelledOrders'];
        totalOrders = responseData['orders']['totalOrders'];
        print(pendingOrders);
        notifyListeners();
      } else {
        print('Api call failed with status code: ${response.statusCode}');
      }
    }
    catch(e){
      print(e);
    }
  }
}