import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uniquesmart/Screen/Login/passwordchange.dart';
import 'package:uniquesmart/Screen/Order/order.dart';
import 'package:uniquesmart/Screen/Profile/dashboard.dart';
// import 'package:uniquesmart/Profile/dashboardd.dart';
import 'package:uniquesmart/Screen/Profile/editprofile.dart';
import 'package:uniquesmart/Screen/Profile/shippingdetails.dart';
import 'package:uniquesmart/Screen/navigationbar/bottomnabbar.dart';
import '../Login/logoutloadingscreen.dart';
import '../../Provider/authprovider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';


late AuthNotifier authNotifier ;
class profileDetails extends StatefulWidget {
  const profileDetails({super.key});

  @override
  State<profileDetails> createState() => _profileDetailsState();
}

class _profileDetailsState extends State<profileDetails> {
  String name = '';
  String email = '';  
    @override
  void initState() {
     authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
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
        setState(() {
        });
      } else {
        // Handle error
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Exception during API call: $e');
    }
    print('namep = ${name}');
    print('emailp = ${email}');
  }
  Color iconColor = Color.fromRGBO(242, 76, 39, 1);
  double iconSize = 18;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            // Navigator.pop(context);
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/0.jpg'),
                      fit: BoxFit.cover)),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding:  EdgeInsets.only(left: 28.0.w, top: 28.h),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color: Color.fromRGBO(241, 241, 241, 0.6),
                      ),
                  child: Text(
                    '${name}',
                    style: TextStyle(fontSize: 22.sp, letterSpacing: 1, fontWeight: FontWeight.w500,
                     fontFamily: 'Ubuntu'
                      ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.w, top: 10.h),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${email}',
                  style: TextStyle( 
                    color: Colors.black,
                    fontSize: 18.sp, letterSpacing:1, fontWeight: FontWeight.w400,
                  fontFamily: 'Ubuntu'),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
               Padding(
              padding: EdgeInsets.only(left: 28.w, top: 20.h, right: 29.w),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> dashboard()) ) ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(255, 145, 145, 145)),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              size: iconSize,
                              color: iconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: iconColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 28, top: 20, right: 29),
              child: GestureDetector(
               onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => myOrder())),
                
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(255, 145, 145, 145)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              size: iconSize,
                              color: iconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'My Order',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Ubuntu'
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: iconColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 28, top: 20, right: 29),
              child: GestureDetector(
                 onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> editProfile() ) )  ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(255, 145, 145, 145)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              size: iconSize,
                              color: iconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Profile Details',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Ubuntu'
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: iconColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28, top: 20, right: 29),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> editShippingDetails() ) ) ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(255, 145, 145, 145)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              size: iconSize,
                              color: iconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Shipping Details',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Ubuntu'
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: iconColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28, top: 20, right: 29),
              child: GestureDetector(
                onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> passwordChange() ) ) ;
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(255, 145, 145, 145)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              size: iconSize,
                              color: iconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Ubuntu'
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: iconColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
           
            Padding(
              padding: EdgeInsets.only(left: 28, top: 20, right: 29),
              child: GestureDetector(
                onTap: () {
                      authNotifier =
                        Provider.of<AuthNotifier>(context, listen: false);
            
                    // Call the logout method
                    authNotifier.logout();
            
                    // Navigate to the login screen or any other desired screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => logoutLoading(),
                      ),
                    );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(255, 145, 145, 145)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              size: iconSize,
                              color: iconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Ubuntu'
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: iconColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
           SizedBox(height: 40,),
            // Center(
            //   child: 
            // )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(initialIndex: 4), 
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80); // start from the bottom-left corner
    path.lineTo(
        size.width, size.height); // draw a line to the bottom-right corner
    path.lineTo(size.width, 0); // draw a line to the top-right corner
    // path.close(); // close the path to create a closed shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
