import 'package:flutter/material.dart';
import 'package:uniquesmart/Screen/Login/login.dart';

class logoutLoading extends StatefulWidget {
  const logoutLoading({super.key});

  @override
  State<logoutLoading> createState() => _logoutLoadingState();
}

class _logoutLoadingState extends State<logoutLoading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
   Navigator.pop(context);
   //block going back 
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (route) => false);


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}