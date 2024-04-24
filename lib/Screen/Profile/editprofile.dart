import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Screen/Profile/profile.dart';
import 'package:uniquesmart/Provider/authprovider.dart';
import 'package:http/http.dart' as http;
  late AuthNotifier authNotifier;
class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController panno = TextEditingController();
  
void initState() {
     authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
    fetchData(authNotifier.token);
  });
    super.initState();
  }
Future<void> fetchData(String token) async {
  try {
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/auth/profile');
    Response response = await http.get(url, headers: {
      'Authorization': 'Bearer ${token}',
    });

    if (response.statusCode == 200) {
      print('Response length: ${response.body.length}');

      print('Data fetched successfully');
      final jsonData = json.decode(response.body);
      final jsonData1 = jsonData as Map<String, dynamic>;

      // Use the `text` property to set the values of the controllers
      name.text = jsonData1['user']['name'];
      email.text = jsonData1['user']['email'];
      phoneno.text = jsonData1['user']['phone_number'];
      panno.text = jsonData1['user']['pan_number'];

      // Similarly, set values for other controllers (phoneno, panno)

      // Print the values
      print('name1 = ${name.text}');
      print('email1 = ${email.text}');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception during API call: $e');
  }
}

  Future<void> updateData(String token) async {
    try {
      print('Updating data...');
      print(token);
      Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/my-profile');
      Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        body: {
          'name': name.text,
          'email': email.text,
          'phone_number': phoneno.text,
          'pan_number': panno.text,
          // Add other fields as needed (phoneno, panno, etc.)
        },
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
      } else {
        print('Failed to update profile. Status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print('Exception during API call: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return profileDetails();
            }));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding:  EdgeInsets.all(22.0.sp),
          child: ListView(children: [
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: phoneno,
              decoration: InputDecoration(
                labelText: 'Phone No',
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: panno,
              decoration: InputDecoration(
                labelText: 'PAN No.',
                hintText: 'Enter your PAN number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {

                  updateData(authNotifier.token);
                },
                child: Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
