import 'package:flutter/foundation.dart';

class WishlistModel extends ChangeNotifier {
  final List<Map<String, dynamic>> products = [];

  void addtofavourite(Map<String, dynamic> product) {
    products.add(product);
    notifyListeners();
  }

  void removeFromfavourite(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}
