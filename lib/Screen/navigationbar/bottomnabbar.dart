import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/Cart/cartnav.dart';
import 'package:uniquesmart/Screen/Category/categorynav.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import 'package:uniquesmart/Screen/Support/support.dart';
import 'package:uniquesmart/Screen/Support/supportdrawer.dart';
import 'package:http/http.dart' as http;
import '../Login/login.dart';
import '../Profile/profile.dart';
import '../../Provider/authprovider.dart';

late AuthNotifier authNotifier ;

class CustomBottomNavigationBar extends StatefulWidget {
   int initialIndex;
   
  CustomBottomNavigationBar({required this.initialIndex});
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>  {

  void onItemTapped(int index) {
     widget.initialIndex = index;
    // setState(() {
     
    // });
  }
@override 
void initState(){
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    authNotifier.token;
  super.initState();

}
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      // width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(100),
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color(0X262525).withOpacity(1),
          )
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.all(10.0.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconButton(0, Icons.home, 'Home'),
            buildIconButton(1, Icons.shopping_bag, 'Category'),
            buildIconButton(2, Icons.shopping_cart, 'Cart'),
            buildIconButton(3, Icons.support, 'Support'),
            buildIconButton(4, Icons.person, 'Profile')
          ],
        ),
      ),
    );
  }
Widget buildIconButton(int index, IconData iconData, String text) {
  return GestureDetector(

       onTap: () {
        onItemTapped(index);
    setState(() {
      widget.initialIndex = index;
    });
        if (index == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => animatedDrawer()));
        }
        if (index == 1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => categoryDrawer()));
        }
        if (index == 2) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => cartdrawer()));
              
        }
        if(index == 3)
        {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => supportdrawer()));
        }
        if(index == 4)
        {
          if(authNotifier.token.isEmpty)
          {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
          }
          else
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => profileDetails()));
        }
      
    },
    child: Container(
      margin: EdgeInsets.only(left: 12.w,right: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // shape: BoxShape.circle,
        color: widget.initialIndex == index
            ? Color.fromRGBO(242, 76, 39, 1)
            : Colors.transparent,
      ),
      child: Padding(
        padding:  EdgeInsets.all(6.0.sp),
        child: Row(
          children: [
            Icon(
              iconData,
              color: widget.initialIndex==index ? Colors.white : Colors.black, // Set the default r the icon
            ),
            // Show text based on the selectedIndex
            if (widget.initialIndex == index)
              Text(
                text,
                style: TextStyle(
                  fontSize: 14.sp,
                  color:widget.initialIndex==index ? Colors.white : Colors.black),
              ),
          ],
        ),
      ),
    ),
  
  
  );
}

}

