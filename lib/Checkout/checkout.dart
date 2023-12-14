import 'package:flutter/material.dart';
// import 'package:uniquesmart/Cart/wishlist.dart';

// import '../Category/category.dart';
// import '../HomeScreen/homescreen.dart';
// import '../Login/login.dart';
// import '../Support/support.dart';
// import '../Support/aboutus.dart';
// import 'cart.dart';
// import 'package:badges/badges.dart' as badges;

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         child: Container(
      //           child: Stack(
      //             children: [
      //               Row(children: [
      //                 //create a profile
      //                 Container(
      //                   // width: 80,
      //                   // height: 80,
      //                   // decoration: BoxDecoration(
      //                   //     shape: BoxShape.circle,
      //                   //     color: const Color.fromRGBO(105, 242, 255, 1)),
      //                   child: CircleAvatar(
      //                     radius: 45,
      //                     backgroundImage: AssetImage('assets/images/0.jpg'),
      //                   ),
      //                 ),

      //                 Padding(
      //                   padding: const EdgeInsets.all(15.0),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Text('Name'),
      //                       SizedBox(
      //                         height: 20,
      //                       ),
      //                       Text('Email')
      //                     ],
      //                   ),
      //                 )
      //               ]),
      //               Positioned(
      //                   bottom: 0,
      //                   right: 10,
      //                   child: Container(
      //                       child: Container(
      //                     width: 110,
      //                     height: 20,
      //                     decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(10),
      //                         color: const Color.fromRGBO(252, 208, 179, 1)),
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(3.0),
      //                       child: Text(
      //                         'Edit Profile',
      //                         style: TextStyle(),
      //                         textAlign: TextAlign.center,
      //                       ),
      //                     ),
      //                   )))
      //             ],
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Home'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => LandingPage()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Categories'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Categories()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('My Orders'),
      //         onTap: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => Brands()),
      //           // );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('My Cart'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => myCart()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Wishlist'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => myWishlist()),
      //           );
      //         },
      //       ),

      //       ListTile(
      //         title: Text('About Company'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => aboutUs()),
      //           );
      //         },
      //       ),
      //        ListTile(
      //         title: Text('Support'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => support()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Login'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Login()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   leading: Builder(builder: (BuildContext context) {
      //     return Padding(
      //       padding: const EdgeInsets.only(left: 24),
      //       child: Container(child: Image.asset("assets/images/logos.png")),
      //     );
      //   }),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 0.0, top: 10),
      //         child: Center(
      //           child: Container(
      //             width: MediaQuery.of(context).size.width * 0.53,
      //             height: 35,
      //             child: Text(
      //               'Checkout',
      //               style: TextStyle(color: Colors.black, fontSize: 20),
      //               textAlign: TextAlign.center,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Builder(builder: (BuildContext context) {
      //       return Container(
      //         child: Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(right: 0.0),
      //               child: Container(
      //                 // width: 35,
      //                 // height: 20,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     badges.Badge(
      //                       badgeStyle: badges.BadgeStyle(
      //                           badgeColor: Color.fromRGBO(242, 76, 39, 1)),
      //                       badgeContent: Text(
      //                         '3',
      //                         style: TextStyle(color: Colors.white),
      //                       ),
      //                       position:
      //                           badges.BadgePosition.topEnd(top: -7, end: 1),
      //                       child: IconButton(
      //                           splashRadius: 20,
      //                           constraints: BoxConstraints(maxWidth: 45),
      //                           onPressed: () {},
      //                           icon: Icon(Icons.shopping_cart),
      //                           color: Colors.black),
      //                     ),
      //                     IconButton(
      //                       onPressed: () {
      //                         Scaffold.of(context).openDrawer();
      //                       },
      //                       splashRadius: 10,
      //                       icon: Icon(Icons.menu),
      //                       color: Colors.black,
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     })
      //   ],
      // ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 120,
                              child: Image.asset('assets/images/ups.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text('Name of the product'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text('2'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete),
                                  ),
                                  Text('Rs 500'),
                                ],
                              ),
                            )
                          ],
                        ),
                        if (index < index - 1)
                          Divider(
                            thickness: 1,
                            height: 2,
                            color: Colors.black,
                          )
                      ],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            //Delivery Location Container
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Delivery Location',
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Arial')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Province, District, ;Municipality, City, Street Number',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      onPressed: () {},
                                      icon: Icon(Icons.delete_outline_sharp,
                                          size: 14),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.note_add_sharp,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              child: Row(children: [
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add_circle_outline_sharp,
                                      size: 14,
                                    )),
                                Text(
                                  'Add New Address',
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            //Order Summary Container
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column( 
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Order Summary', style: TextStyle (fontSize: 18) ,),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Subtotal'), Text('Rs 500')],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Subtotal'), Text('Rs 500')],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Subtotal'), Text('Rs 500')],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Subtotal'), Text('Rs 500')],
                    ),
                  ]),
                ),
              ),
            ),
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkout()),
                );
              
              },
              child: Text('Place Order'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 70, vertical: 10)),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(242, 76, 39, 1))),
            ),
          ],
        ),
      ),
    );
  }
}
