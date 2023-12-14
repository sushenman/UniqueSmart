import 'package:flutter/material.dart';
import 'package:uniquesmart/HomeScreen/landingdrawer.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => animatedDrawer() ));
      },
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //after 2 secs it will navigate to home screen
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logof.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),


    );
  }
}