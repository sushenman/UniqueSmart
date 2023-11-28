// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uniquesmart/HomeScreen/allproducts.dart';
import 'package:uniquesmart/ProductDetail/categoryProducts.dart';

import '../HomeScreen/homescreen.dart';
import '../Support/support.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

int selectedCategoryIndex = -1;

List categoryLink = [
  inverterCategory(),
  SolarCategory(),
  BatteryCategory(),
  GeneratorCategory(),
  UPSCategory()
];
List<String> categories = ['Inverter', 'Solar', 'Battery', 'Generator', 'UPS'];

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
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
              title: Text('Support'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => support()),
                );
              },
            ),
            ListTile(
              title: Text('About Company'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.53,
                  height: 35,
                  child: const TextField(
                    decoration: InputDecoration(
                      // hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
      
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 100,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: selectedCategoryIndex == index
                          ? Colors.blue
                          : Colors.grey[300],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                              width: 60,
                              height: 60,
                              // child: Image.asset('assets/images/0.jpg'),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle)),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: selectedCategoryIndex != -1
                  ? categoryLink[selectedCategoryIndex]
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}

//create a class
class inverterCategory extends StatefulWidget {
  const inverterCategory({super.key});

  @override
  State<inverterCategory> createState() => _inverterCategoryState();
}

class _inverterCategoryState extends State<inverterCategory> {
  List<String> inverterType = [
    'Type1',
    'Type2',
    'Type3',
    'Type4',
    'Type5',
    'Type6'
  ];
  List<String> inverterdesc = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:28.0, bottom: 8),
                            child: Center(
                              child: Text(
                                inverterType[index],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                              //check if the index is within the range of inverterdesc
                              // child: inverterdesc.length < inverterType.length
                              //     ? Container()
                              //     : Container(child: Text(inverterdesc[index]))
                              child: inverterdesc == index
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Container(
                                        child: Text(inverterdesc[index]),
                                      ),
                                    )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => categoryProducts()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text('View Products'),
                                    Icon(Icons.play_arrow_rounded)
                                  ],
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 10)),
                                    shadowColor: MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                    elevation:
                                        MaterialStateProperty.all<double>(0),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(242, 76, 39, 1))),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'View Catalogue',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    )
                                  ],
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 10)),
                                    shadowColor: MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                    elevation:
                                        MaterialStateProperty.all<double>(0),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(0, 0, 0, 1))),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: inverterType.length,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SolarCategory extends StatefulWidget {
  const SolarCategory({super.key});

  @override
  State<SolarCategory> createState() => _SolarCategoryState();
}

class _SolarCategoryState extends State<SolarCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          Container(
            child: Text('Solar'),
          )
        ],
      ),
    );
  }
}

class BatteryCategory extends StatefulWidget {
  const BatteryCategory({super.key});

  @override
  State<BatteryCategory> createState() => _BatteryCategoryState();
}

class _BatteryCategoryState extends State<BatteryCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          Container(
            child: Text('Battery'),
          )
        ],
      ),
    );
  }
}

class GeneratorCategory extends StatefulWidget {
  const GeneratorCategory({super.key});

  @override
  State<GeneratorCategory> createState() => _GeneratorCategoryState();
}

class _GeneratorCategoryState extends State<GeneratorCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          Container(
            child: Text('Generator'),
          )
        ],
      ),
    );
  }
}

class UPSCategory extends StatefulWidget {
  const UPSCategory({super.key});

  @override
  State<UPSCategory> createState() => _UPSCategoryState();
}

class _UPSCategoryState extends State<UPSCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          Container(
            child: Text('UPS'),
          )
        ],
      ),
    );
  }
}
