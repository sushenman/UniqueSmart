import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:uniquesmart/Provider/authprovider.dart';
  import 'package:http/http.dart' as http;
  
  late AuthNotifier authNotifier;
class editShippingDetails extends StatefulWidget {
  const editShippingDetails({super.key});

  @override
  State<editShippingDetails> createState() => _editShippingDetailsState();
}

class _editShippingDetailsState extends State<editShippingDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController title = TextEditingController();

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
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/shipping-details');
    Response response = await http.get(url, headers: {
      'Authorization': 'Bearer ${token}',
    });
    print(response.statusCode);

//print the response
    print(response.body);
    if (response.statusCode == 200) {
      // print('Response length: ${response.body.length}');
      //  print('Response body: ${response.body}');  
      // print('Data fetched successfully');
      final jsonData = json.decode(response.body);
      final jsonData1 = jsonData as Map<String, dynamic>;

      // name.text = jsonData1['name'];
      // email.text = jsonData1['email'];
      // phoneno.text = jsonData1['phone_number'];
      // province.text = jsonData1['state'];
      // zone.text = jsonData1['zone'];
      // district.text = jsonData1['district'];
      // city.text = jsonData1['city'];
      // street.text = jsonData1['street'];
      // title.text = jsonData1['title'];


      // Use the `text` property to set the values of the controllers
      name.text = jsonData1['detail']['name'];
      email.text = jsonData1['detail']['email'];
      phoneno.text = jsonData1['detail']['phone_number'];
      province.text = jsonData1['detail']['province'];
      zone.text = jsonData1['detail']['zone'];
      district.text = jsonData1['detail']['district'];
      city.text = jsonData1['detail']['city'];
      street.text = jsonData1['detail']['street'];
      // state.text = jsonData1['contact']['state'];

    

      // Similarly, set values for other controllers (phoneno, panno)

      // Print the values
      print('name1 = ${name.text}');
      print('email1 = ${email.text}');
      print('phoneno1 = ${phoneno.text}');
      print('province1 = ${province.text}');
      print('zone1 = ${zone.text}');
      print('district1 = ${district.text}');
      print('city1 = ${city.text}');
      print('street1 = ${street.text}');
      print('state1 = ${title.text}');

    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception during API call: $e ');
  }
}

  Future<void> updateData(String token) async {
    try {
      print('Updating data...');
      print(token);
      Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/shipping-details');
      Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        body: {
          'name': name.text,
          'email': email.text,
          'phone_number': phoneno.text,
          'state': province.text,
          'zone': zone.text,
          'district': district.text,
          'city': city.text,
          'street': street.text,
          'title': title.text,


          // Add other fields as needed (phoneno, panno, etc.)
        },
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        print(response.body);

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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding:  EdgeInsets.all(28.0.sp),
          child: ListView(children: [
            Text(
              'Shipping Information',
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: name ,
              decoration: InputDecoration(
                labelText: 'Full Name',
             
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
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: province,
              decoration: InputDecoration(
                labelText: 'Province',
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
              SizedBox(
              height: 30,
            ),
            TextField(
              controller: title,
              decoration: InputDecoration(
                labelText: 'Title',
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            
            SizedBox(
              height: 30,
            ),
             TextField(
              controller: zone,
              decoration: InputDecoration(
                labelText: 'Zone',
        
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
             TextField(
              controller: district,
              decoration: InputDecoration(
                labelText: 'District',
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
             TextField(
              controller: city,
              decoration: InputDecoration(
                labelText: 'City',
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
             TextField(
              controller: street,
              decoration: InputDecoration(
                labelText: 'Street',
               
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
