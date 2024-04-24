import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// import '../ProductFetch/fetchproduct.dart';
import '../Screen/Cart/carthelper.dart';

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
  String _columnQuantity = 'quantity';
  String _columnSlug = 'slug';
  String _columnDescription = 'description';
  String columncategory = 'category_name';
 String _columnIsChecked = 'isChecked';
  Future<Database> getDb() async {
      final dbPath = join(await getDatabasesPath(), _dbName);
  print('Database path: $dbPath');
    return openDatabase(
      
      join(dbPath),
      
      onCreate: (db, version) => db.execute("""
        CREATE TABLE $_tableName (
          $_columnSlug TEXT,
          $_columnName TEXT UNIQUE,
          $_columnImage TEXT,
          $_columnPrice TEXT,
          $_columnQuantity TEXT,
          $_columnDescription TEXT,
          $columncategory TEXT,
          $_columnIsChecked TEXT,
          $_columnId INTEGER PRIMARY KEY  AUTOINCREMENT
        )  
      """),

      version: version,
      
    );
    
  }
Future<int> addCart(Map<String, dynamic> cart) async {
  _db = await getDb();
  try {
    int result = await _db!.insert(_tableName, cart);

    // Retrieve existing cart data from SharedPreferences
    SharedPreferences prefs = await _prefs;  // Await the SharedPreferences instance
    List<dynamic> existingCartData = json.decode(prefs.getString('cart') ?? '[]');

    // Add the new item to the cart data
    existingCartData.add(cart);

    // Save the updated cart data back to SharedPreferences
    prefs.setString('cart', json.encode(existingCartData));

    print('Item added to cart with id: $result'); 

    return result;
  } catch(e) {
    print(e);
    return 0;
  }
}


Future<List<Cart>> getCart() async {
  _db = await getDb();
  print('Fetching data from database');
  final List<Map<String, dynamic>> cartMap = await _db!.query(_tableName);
  print('Raw data from database: $cartMap');
  return cartMap.map((item) {
    print('Item: $item');
    return Cart.fromJson(item);
  }).toList();

}



  Future<int> deleteCart(int id) async {
    _db = await getDb();
    return _db!.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
     
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
