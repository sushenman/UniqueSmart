import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/Category/categorynav.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import 'package:uniquesmart/Screen/Login/logoutloadingscreen.dart';
import 'package:uniquesmart/Screen/Profile/dashboard.dart';
import 'package:uniquesmart/Screen/Profile/profile.dart';
import 'package:uniquesmart/Screen/Support/supportdrawer.dart';
import 'package:uniquesmart/Provider/authprovider.dart';
import 'Screen/Cart/cartnav.dart';
import 'Screen/Login/login.dart';
import 'Screen/Support/aboutus.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

late AuthNotifier authNotifier;
List<String> navigationItems = [
  'Home',
  'Categories',
  'My Cart',
  'Support',
  'About Company',
  'Profile',
  'Logout'
];
String name = '';
String email = '';
List<IconData> icons = [
  Icons.home,
  Icons.category,
  // Icons.shopping_cart,
  Icons.shopping_cart,
  // Icons.favorite,
  Icons.support,
  Icons.info,
  Icons.login,
  Icons.logout
];

List<Widget> pages = [
  animatedDrawer(),
  categoryDrawer(),
  // myOrder(),
  cartdrawer(),
  // wishlistDrawer(),
  supportdrawer(),
  aboutUs(),
  profileDetails(),
];

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  void initState() {
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    fetchData(authNotifier.token);
    super.initState();
  }

  Future<void> fetchData(String token) async {
    print('Fetching data...');
    try {
      final response = await http.get(
        Uri.parse('https://api.uniquesmartindustries.com/api/auth/profile'),
        headers: {
          'Authorization': 'Bearer $token',

          // Other headers if needed
        },
      );
      if (response.statusCode == 200) {
        // Successfully fetched data
        // Convert response body to JSON
        print(response.body);
        final jsonData = json.decode(response.body);
        print('JSON DATA = ${jsonData}');
        final jsonData1 = json.decode(response.body) as Map<String, dynamic>;
        print('Json data1 ${jsonData1}');

        name = jsonData1['user']['name'];
        email = jsonData1['user']['email'];
      } else {
        // Handle error
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Exception during API call: $e');
    }
    // print('name1 = ${name}');
    // print('email1 = ${email}');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 200,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(242, 76, 39, 0.8),
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            name.isEmpty
                ? Container(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              icons[5],
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // onTap: () {
                        //   if (pages[index] == pages[0]) {
                        //     Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => pages[index],
                        //       ),
                        //     );
                        //   } else {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => pages[index],
                        //       ),
                        //     );
                        //   }
                        // },
                      ),
                    ),
                  ))
                : Container(
                    height: 200,
                    child: DrawerHeader(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          // color: Color.fromRGBO(242, 76, 39, 0.8),
                          // image: DecorationImage(
                          //   image: AssetImage('assets/images/0.jpg'),
                          //   fit: BoxFit.cover,
                          // ),
                          ),
                      // height: 200,
                      child: Stack(children: [
                        name.isEmpty
                            ? Container(
                                height: 0,
                                // child: Text('Login to view profile', style: TextStyle(color: Colors.white), )
                              )
                            : Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                // width: 100,
                                decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/0.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // child: Image.asset('assets/images/0.jpg') ,
                              ),
                        name.isEmpty
                            ? Container(
                                height: 0,
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // CircleAvatar(
                                    //   radius: 50,
                                    //   backgroundImage:
                                    //       AssetImage('assets/images/1.jpg'),
                                    // ),
                                    SizedBox(height: 130),
                                    Text(
                                      name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      email,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ]),
                    ),
                  ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: name.isEmpty
                    ? navigationItems.length - 2
                    : navigationItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //if the icon is login and user is not logged in then donot show the login icon

                        Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          navigationItems[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      if (navigationItems[index] == 'Logout') {
                        AuthNotifier authNotifier =
                            Provider.of<AuthNotifier>(context, listen: false);
                        // Call the logout method
                        authNotifier.logout();
                        name = '';
                        email = '';
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => logoutLoading(),
                          ),
                        );
                      } else if (navigationItems[index] == 'Profile') {
                        if (name.isEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pages[index],
                            ),
                          );
                        } 
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ),
                        );
                     
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
