import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// import '../ProductFetch/fetchproduct.dart';
import '../Cart/carthelper.dart';

class dbhelper {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Database? _db;
  int version = 1;
  String _dbName = 'cart.db';
  String _tableName = 'cart';
  String _columnId = 'id';
  String _columnName = 'title';
  String _columnPrice = 'price';
  String _columnImage = 'image';
  String _columnQuantity = 'category_name';
  String _columnSlug = 'slug';
String _columnDescription = 'description';
  Future<Database> getDb() async {
      final dbPath = join(await getDatabasesPath(), _dbName);
  print('Database path: $dbPath');
    return openDatabase(
      
      join(dbPath),
      
      onCreate: (db, version) => db.execute("""
        CREATE TABLE $_tableName (
          $_columnSlug TEXT,
          $_columnName TEXT,
          $_columnImage TEXT,
          $_columnPrice TEXT,
          $_columnQuantity TEXT,
          $_columnDescription TEXT,
          $_columnId INTEGER PRIMARY KEY  AUTOINCREMENT
        )
      """),

      version: version,
      
    );
    
  }
Future<int> addCart(Map<String, dynamic> cart) async {
  _db = await getDb();
  int result = await _db!.insert(_tableName, cart);

  // Retrieve existing cart data from SharedPreferences
  SharedPreferences prefs = await _prefs;  // Await the SharedPreferences instance
  List<dynamic> existingCartData = json.decode(prefs.getString('cart') ?? '[]');

  // Add the new item to the cart data
  existingCartData.add(cart);

  // Save the updated cart data back to SharedPreferences
  prefs.setString('cart', json.encode(existingCartData));

  return result;
}


Future<List<Cart>> getCart() async {
  final SharedPreferences prefs = await _prefs;
  final String cartJson = prefs.getString('cart') ?? '[]';
  print('Raw JSON data from SharedPreferences: $cartJson');
  final List<dynamic> cartData = json.decode(cartJson);
  print('Decoded data: $cartData');
  return cartData.map((item) => Cart.fromJson(item)).toList();
}


  Future<int> deleteCart(int id) async {
    _db = await getDb();
    return _db!.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
      // conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<int> updateCart(Map<String, dynamic> cart) async {
    _db = await getDb();
    return _db!.update(_tableName, cart,
        where: '$_columnId = ?', whereArgs: [cart['id']]);
  }

  Future<int> deleteAll() async {
    _db = await getDb();
    return _db!.delete(_tableName);
  }
}
