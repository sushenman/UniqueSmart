import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/logof.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Register',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Register'),
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
          ),
          ],
        ),
      ),
    );
  }
}
