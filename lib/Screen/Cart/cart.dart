import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniquesmart/Screen/Cart/cartnav.dart';
import 'package:uniquesmart/Screen/Checkout/checkoutnav.dart';
import 'package:uniquesmart/Screen/Login/login.dart';
import 'package:uniquesmart/Screen/navigationbar/bottomnabbar.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import '../../helper/dbhelper.dart';
import 'cartModel.dart';
import 'carthelper.dart';

class myCart extends StatefulWidget {
  const myCart({Key? key, this.slug}) : super(key: key);
  final String title = 'Cart';
  final String? slug;

  @override
  State<myCart> createState() => _MyCartState();
}

class _MyCartState extends State<myCart> {
  final dbhelper _db = dbhelper();
  late SharedPreferences _prefs;

  List<Cart> products = [];
  List<bool> selectedItems = [];

  @override
  void initState() {
    _initSharedPreferences();
    super.initState();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    displayResults();
  }

  Future<void> displayResults() async {
    products = await _db.getCart();
    setState(() {
      selectedItems = List.generate(products.length, (index) => false);
      products.removeWhere((item) => item.isChecked == 'true');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, index) {
                      final cartItem = products[index];
                      return buildCartItem(cartItem, index);
                    },
                  ),
                  buildActionButtons(),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(initialIndex: 2),
        ],
      ),
    );
  }

  Widget buildCartItem(Cart cartItem, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        child: Column(
          children: [
            CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              controlAffinity: ListTileControlAffinity.leading,
              value: cartItem.isChecked == 'false' ? false : true,
              onChanged: (newValue) {
                setState(() {
                  cartItem.isChecked == 'false'
                      ? cartItem.isChecked = 'true'
                      : cartItem.isChecked = 'false';
                  _db.updateCart(cartItem.toJson());
                  cartItem.isChecked = newValue.toString();
                });
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            cartItem.image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.56,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 1.0, bottom: 10),
                                child: Container(
                                  width: 300,
                                  child: Text(
                                    cartItem.title,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: 200,
                              //   child: Flexible(
                              //     child: RichText(
                              //       maxLines: 1,
                              //       overflow: TextOverflow.ellipsis,
                              //       text: TextSpan(
                              //         text: cartItem.description,
                              //          style: TextStyle(
                              //           color: const Color.fromARGB(
                              //             110,
                              //             0,
                              //             0,
                              //             0,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1.0,
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rs ${cartItem.price}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              onPressed:                                                    () {
                                                setState(() {
                                                  if (cartItem.quantity ==
                                                      '1') {
                                                    cartItem.quantity = '1';
                                                  } else {
                                                    cartItem.quantity =
                                                        (int.parse(cartItem
                                                                    .quantity) -
                                                                1)
                                                            .toString();
                                                  }
                                                  _db.updateCart(
                                                      cartItem.toJson());
                                                  updateCartInSharedPreferences(
                                                      products);
                                                });
                                              },
                                              icon: Icon(Icons.remove_circle),
                                            ),
                                            Text(cartItem.quantity),
                                            IconButton(
                                              onPressed: () async {
                                                setState(() {
                                                  if (cartItem.quantity ==
                                                      1) {
                                                    cartItem.quantity = "1";
                                                  } else {
                                                    cartItem.quantity =
                                                        (int.parse(cartItem
                                                                    .quantity) +
                                                                1)
                                                            .toString();
                                                  }
                                                });
                                                _db.updateCart(
                                                    cartItem.toJson());
                                                updateCartInSharedPreferences(
                                                    products);
                                              },
                                              icon: Icon(Icons.add_circle),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
         
          child: ElevatedButton(
            onPressed: () {
              // Navigate to checkout with selected items
              List<Cart> selectedItems = getSelectedItems();
              if(authNotifier.token.isEmpty){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login() ,
                  ),
                );
              }
              else
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => checkoutDrawer(
                    selectedItems: selectedItems,
                  ),
                ),
                


              );
                //change the isCheckout to false of all items in the cart after clicking on checkout
                for (Cart item in products) {
                  item.isChecked = 'false';
                  _db.updateCart(item.toJson());
                }
            },
            child: Text(
              'Checkout',
              style: TextStyle(color: Colors.white),
            ),
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
        ),
        SizedBox(
          width: 10,
        ),
        Visibility(
          child: ElevatedButton(
            onPressed: () {
              // Delete selected items
              List<Cart> selectedItems = getSelectedItems();
              for (Cart item in selectedItems) {
                _db.deleteCart(item.id ?? 0);
              }
              setState(() {
                products.removeWhere((item) => item.isChecked == 'true');
              });
              updateCartInSharedPreferences(products);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
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
          visible: products.any((item) => item.isChecked == 'true'),
        ),
      ],
    );
  }

  Future<void> updateCartInSharedPreferences(List<Cart> cartItems) async {
    final String cartJson =
        json.encode(cartItems.map((item) => item.toJson()).toList());
    await _prefs.setString('cart', cartJson);
  }

  List<Cart> getSelectedItems() {
    return products.where((item) => item.isChecked == 'true').toList();

  }
}

