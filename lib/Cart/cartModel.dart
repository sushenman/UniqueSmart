import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniquesmart/Cart/carthelper.dart';

import '../helper/dbhelper.dart';
import 'carthelper.dart';

class CartModel extends ChangeNotifier {

  final List<Map<String, dynamic>> Cart = [];

    // late SharedPreferences _prefs;

  void addToCart(Map<String, dynamic> product) {
    Cart.add(product);
    //add the products in db 
    dbhelper db = dbhelper();
    db.addCart(product);

    notifyListeners();
  }
  //  Future<void> _initSharedPreferences() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }


  void removeFromCart(int index) {
    Cart.removeAt(index);
    //delete the products in db 
    dbhelper db = dbhelper();
    db.deleteCart(index);
    notifyListeners();
  }
}