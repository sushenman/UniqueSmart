import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniquesmart/Checkout/checkoutnav.dart';

import 'cartModel.dart';
import '../helper/dbhelper.dart';
import 'carthelper.dart';

class myCart extends StatefulWidget {
  const myCart({Key? key, this.slug}) : super(key: key);
  final String title = 'Cart';
  final String? slug;

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  final dbhelper _db = dbhelper();
  late SharedPreferences _prefs;
  
List<Cart> products=[];
  @override
  void initState() {

        displayResults();
    _initSharedPreferences();

    print('object');
        super.initState();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  displayResults() async {
    print('hello');
     products = await _db.getCart();
    print(products);
    for (Cart product in products) {
      // print('ID: ${product.id}')
      print("Title: ${product.title}");
      print("Price: ${product.price}");
      // print("Quantity: ${product.quantity}");
      print("-----");
    }
    // setState(() {
      
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder( future: displayResults() ,
        builder: (BuildContext context, snapshot)
      {
return Container(

          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      final cartItem = products[index];
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: 120,
                                  child: Image.network(
                                    cartItem.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.65,
                                    height: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Container(width: 200, child: Text(cartItem.title)),
                                            ),
                                            IconButton(
                                              onPressed: ()  {
                                                _db.deleteCart(1);
                                                //    _db.deleteCart(cartItem.id);
                                              //    updateCartInSharedPreferences(cart.products);
                                              },
                                              icon: Icon(Icons.delete),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  onPressed: () async {
                                                    // setState(() {
                                                    //   if (cartItem.quantity > 1) {
                                                    //     cartItem.quantity--;
                                                    //   } else {
                                                    //     cartItem.quantity = "1";
                                                    //   }
                                                    // });
                                                    // _db.updateCart(cartItem);
                                                    // updateCartInSharedPreferences(cart.products);
                                                  },
                                                  icon:
                                                      Icon(Icons.remove_circle),
                                                ),
                                                // Text(cartItem['quantity']),
                                                IconButton(
                                                  onPressed: () async {
                                                    // setState(() {
                                                    //   cartItem['quantity']++;
                                                    // });
                                                    // _db.updateCart(cartItem);
                                                    // updateCartInSharedPreferences(cart.products);
                                                  },
                                                  icon: Icon(Icons.add_circle),
                                                ),
                                              ],
                                            ),
                                            Text('Rs ${cartItem.price}')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              height: 1,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount:products.length,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => checkoutDrawer()),
                    );
                  },
                  child: Text('Checkout'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    ),
                    shadowColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(242, 76, 39, 1),
                    ),
                  ),
                ),
              ],
            ),
          
        
      ),
);
      } )
      // body: Consumer<CartModel>(builder: (context,  Cart, child) {
       
      // }),
    );
  }

  Future<void> updateCartInSharedPreferences(List<Cart> cartItems) async {
    final String cartJson = json.encode(cartItems.map((item) => item.toJson()).toList());
    await _prefs.setString('cart', cartJson);
  }
}
