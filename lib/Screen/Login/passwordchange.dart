import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Provider/authprovider.dart';

late AuthNotifier authNotifier;

class passwordChange extends StatefulWidget {
  const passwordChange({Key? key}) : super(key: key);

  @override
  State<passwordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<passwordChange> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  }

  passwordChange(String token) async {
    var errorMsg;
    // var errorPassMsg;
    try {
      print('Token: $token');
      Uri url = Uri.parse(
          'https://api.uniquesmartindustries.com/api/change-password');
      Response response = await post(url, headers: {
        'Authorization': 'Bearer ${token}',
      }, body: {
        'oldpassword': oldPassword.text,
        'password': newPassword.text,
        'password_confirmation': confirmPassword.text,
      });
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.contains('error')) {
          //print the value of message from the response body
      var error; 
      error = json.decode(response.body)['message'];

          error.runtimeType == String
              ? errorMsg = json.decode(response.body)['message']
              :  errorMsg = json.decode(response.body)['message']['password'];
          print(errorMsg.runtimeType);

          final snackBar = SnackBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              content: AwesomeSnackbarContent(
                title: 'Error',
                message: '$errorMsg',
                contentType: ContentType.failure,
              ));
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else {
          print('Password changed successfully');
        }
      } else {
        print('Failed to change password. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: oldPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Old Password",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: newPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter New Password",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: confirmPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Confirm New Password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle password change logic
                  passwordChange(authNotifier.token);
                },
                child: Text("Change Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
