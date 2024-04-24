import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';

class orderComplete extends StatefulWidget {
  const orderComplete({super.key});

  @override
  State<orderComplete> createState() => _orderCompleteState();
}

class _orderCompleteState extends State<orderComplete> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
     Navigator.push(  
        context,  
        MaterialPageRoute(builder: (context) => animatedDrawer()),);
    });
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true, // Added this to allow ListView to be centered
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
                ),
                Container(
                  child: Text('Thank you', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                Container(
                  child: Text('Your order has been placed successfully', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
 
  }
}