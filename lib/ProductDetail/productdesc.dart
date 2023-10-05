import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class productDescription extends StatefulWidget {
  const productDescription({super.key});

  @override
  State<productDescription> createState() => _productDescriptionState();
}

class _productDescriptionState extends State<productDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Stack(
                  children: [
                    Row(children: [
                      Container(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/images/0.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Name'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Email')
                          ],
                        ),
                      )
                    ]),
                    Positioned(
                        bottom: 0,
                        right: 10,
                        child: Container(
                            child: Container(
                          width: 110,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(252, 208, 179, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )))
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
            ListTile(
              title: Text('My Orders'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Brands()),
                // );
              },
            ),
            ListTile(
              title: Text('My Cart'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
            ListTile(
              title: Text('Wishlist'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
            ListTile(
              title: Text('About Company'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(child: Image.asset("assets/images/logos.png")),
          );
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Builder(builder: (BuildContext context) {
            return Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Container(
                      // width: 35,
                      // height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          badges.Badge(
                            badgeStyle: badges.BadgeStyle(
                                badgeColor: Color.fromRGBO(242, 76, 39, 1)),
                            badgeContent: Text(
                              '3',
                              style: TextStyle(color: Colors.white),
                            ),
                            position:
                                badges.BadgePosition.topEnd(top: -7, end: 1),
                            child: IconButton(
                                splashRadius: 20,
                                constraints: BoxConstraints(maxWidth: 45),
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart),
                                color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            splashRadius: 10,
                            icon: Icon(Icons.menu),
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
      body: SlidingUpPanel(
        collapsed: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the product',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('RS. 0000',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                        ),
                        Text('4.5/5'),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),

                    GestureDetector(
                      onTap: (){
                        print('pressed');
                      
                      } ,
                      child: Icon(Icons.favorite_outline_outlined, size: 22,)
                    )
                    // Icon(Icons.favorite_border, size: 18,)
                  ],
                )
              ],
            ),
          ),
        ),
        panel: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the product',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('RS. 0000',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                        ),
                        Text('4.5/5'),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),

                    GestureDetector(
                      onTap: (){
                        print('pressed');
                      
                      } ,
                      child: Icon(Icons.favorite_outline_outlined, size: 22,)
                    )
                    // Icon(Icons.favorite_border, size: 18,)
                  ],
                )
              ],
            ),
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start ,
          // crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Image.asset('assets/images/0.jpg', fit: BoxFit.fill ),
          ],
        )
      ),
    );
  }
}
