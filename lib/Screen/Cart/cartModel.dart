import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uniquesmart/Screen/Cart/carthelper.dart';

import '../../helper/dbhelper.dart';
// import 'carthelper.dart';
// import 'package:shared_preferences/shared_preferences.dart';
class CartModel extends ChangeNotifier {

  final List<Map<String, dynamic>> Cart = [];

    // late SharedPreferences _prefs;

  late SharedPreferences _prefs;
  int _cartCount = 0;

  CartModel() {
    _initSharedPreferences();
  }
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get cartCount => _cartCount;
  void addToCart(Map<String, dynamic> product, int quantity,String isChecked) {
    //add product and quantity in cart
    product['quantity'] = quantity;
    product['isChecked'] = isChecked;
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

  void updateCartCount() {
    // You can update the cart count based on the current Cart list
    // This can be useful when initializing the cart count from the database.
    _cartCount = Cart.length;
    _prefs.setInt('cartCount', _cartCount);

    // notifyListeners(); // No need to notify listeners here
  }
}