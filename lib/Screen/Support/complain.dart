import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:uniquesmart/Screen/HomeScreen/homescreen.dart';
import 'package:uniquesmart/global.dart';
import 'package:http_parser/http_parser.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class complain extends StatefulWidget {
  const complain({Key? key}) : super(key: key);

  @override
  State<complain> createState() => _ComplainState();
}

List<String> state = [
  'Province 1',
  'Province 2',
  'Province 3',
  'Province 4',
  'Province 5',
  'Province 6',
  'Province 7',
];
List<String> category = [
  'Amaron Quanta',
  'Battery',
  'BOOM',
  'Bravo',
  'ELITO',
  'GS',
  'HBL SMF Battery',
  'Home Ups',
  'Inverter Tubular Battery',
  'Inzen',
  'Massimo',
  'Mppt Controller',
  'Online Ups',
  'Package',
  'PWM Controller',
  'Saver',
  'Smartan',
  'Solar Charge',
  'Solar Panel',
  'Solar PCU',
  'Solar Tubular Battery',
  'Superb',
  'Unisko',
  'Volmaxx',
  'Water Purifier'
];

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController comp = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController street = TextEditingController();
TextEditingController landmark = TextEditingController();
TextEditingController productName = TextEditingController();
TextEditingController productSerialNo = TextEditingController();
TextEditingController city = TextEditingController();

TextEditingController Remarks = TextEditingController();
String selectedImagePath = '';
String selectedImagePath2 = '';
String selectedImagePath3 = '';
final ImagePicker _imagePicker = ImagePicker();

String selectStateCategory = state.isEmpty ? 'Select State' : state[0];
String selectCategory = category.isEmpty ? 'Select Category' : category[0];
DateTime? selectedDate;

class _ComplainState extends State<complain> {
  Future<void> _pickImage(int imageNumber) async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          selectedImagePath = pickedFile.path;
        } else if (imageNumber == 2) {
          selectedImagePath2 = pickedFile.path;
        } else if (imageNumber == 3) {
          selectedImagePath3 = pickedFile.path;
        }
      });
    }
    // selectedImagePath='';
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  @override
  void dispose() {
    selectedImagePath = '';
    selectedImagePath2 = '';
    selectedImagePath3 = '';
    super.dispose();
  }

  updateCompData() async {
    // Create a map to represent the data
if(name.text.isEmpty || email.text.isEmpty || phone.text.isEmpty || city.text.isEmpty || address.text.isEmpty || street.text.isEmpty || landmark.text.isEmpty || productName.text.isEmpty || productSerialNo.text.isEmpty || comp.text.isEmpty || Remarks.text.isEmpty || selectedImagePath.isEmpty || selectedImagePath2.isEmpty || selectedDate==null){
  final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Enter all the fields to submit the complain' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
}
//check if the fields are empty or not 
    if (name.text.isEmpty) {
       final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Enter your name to submit the complain' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(email.text.isEmpty){
      final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Enter your email' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(phone.text.isEmpty){
       final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Enter your phone number' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(city.text.isEmpty){
       final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Enter your city' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(address.text.isEmpty){
       final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
            message: 'Enter your address' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(street.text.isEmpty){
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: ' Enter your street' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(landmark.text.isEmpty){
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: ' Enter your landmark' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(productName.text.isEmpty){
  final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message:  ' Product Name cannot be empty' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(productSerialNo.text.isEmpty){
       final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: ' Product Serial No cannot be empty' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }
    if(comp.text.isEmpty){
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: ' Complain cannot be empty' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }

  
    if(selectedDate==null){
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: ' Select the date of purchase' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
      return;
    }

    // Create the URL
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/complains');

    // Create the request
    var request = http.MultipartRequest('POST', url);

    // Add the API key to the headers
    request.headers['apikey'] =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';

    // Set the request body with the JSON data

    // Set the content type header
    // request.headers['Content-Type'] = 'application/json';

    // Add image files if they are not empty
    var warrnt;
    if (selectedImagePath.isNotEmpty) {
      var warrantyImage = await http.MultipartFile.fromPath(
        'warrenty',
        selectedImagePath,
        contentType: MediaType('image', 'jpg'), // Adjust content type as needed
      );
      warrnt = warrantyImage.filename;
      // request.files.add(warrantyImage);
    }
var billCard;
    if (selectedImagePath2.isNotEmpty) {
      var billCardImage = await http.MultipartFile.fromPath(
        'bill_card',
        selectedImagePath2,
        // contentType: MediaType('image', 'jpg'), // Adjust content type as needed
      );
        billCard = billCardImage.filename;
      // request.files.add(billCardImage);
      print(billCardImage.filename);
    }

    request.fields['name'] = name.text;
    request.fields['email'] = email.text;
    request.fields['phone_number'] = phone.text;
    request.fields['state'] = selectStateCategory;
    request.fields['city'] = city.text;
    request.fields['address'] = address.text;
    request.fields['street'] = street.text;
    request.fields['landmark'] = landmark.text;
    request.fields['category'] = selectCategory;
    request.fields['product_name'] = productName.text;
    request.fields['product_serial'] = productSerialNo.text;
    request.fields['date_of_purchase'] = _formatDate(selectedDate!);
    request.fields['complain_type'] = comp.text;
    request.fields['remarks'] = 'Nothing';
    request.fields['warrenty'] = warrnt;
    // request.fields['bill_card'] = billCard;

    // Map<String, dynamic> data = {
    //   'name': name.text,
    //   'email': email.text,
    //   'phone_number': phone.text,
    //   'state': selectStateCategory,
    //   'city': city.text,
    //   'address': address.text,
    //   'street': street.text,
    //   'landmark': landmark.text,
    //   'category': selectCategory,
    //   'product_name': productName.text,
    //   'product_serial': productSerialNo.text,
    //   'date_of_purchase': _formatDate(selectedDate!),
    //   'complain_type': comp.text,
    //   'remarks': 'Nothing',
    //   'warrenty': warrnt,
    //   'bill_card': billCard,

    // };
     

    // Encode the data as JSON

    // Send the request
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final decodedData = jsonDecode(responseData.body);
        print(decodedData);
        if (decodedData['result'] == 'success') {
          // Clear form fields and show a success message
          name.clear();
          email.clear();
          phone.clear();
          city.clear();
          address.clear();
          street.clear();
          landmark.clear();
          productName.clear();
          productSerialNo.clear();
          selectedDate = null;
          selectedImagePath = '';
          selectedImagePath2 = '';
          selectedImagePath3 = '';
          // ... (your existing code to clear form fields)
     final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Success' ,
          message: 'Your complain has been submitted successfully' ,
          contentType: ContentType.success,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);

          //
        }
      } else {
        print('Failed to submit form. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error submitting form: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Complain',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          )),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 237, 247, 254),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  'Fill in the form to register your complaint, and our representatives will get in touch with you at the earliest.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: city,
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5, bottom: 5),
                    child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text('Select State'),
                      value: selectStateCategory,
                      items: state.map((category) {
                        return DropdownMenuItem(
                          child: Text(category),
                          value: category,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectStateCategory = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: comp,
                    decoration: InputDecoration(
                      labelText: 'Complain',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: address,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: street,
                    decoration: InputDecoration(
                      labelText: 'Street',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: landmark,
                    decoration: InputDecoration(
                      labelText: 'Landmark',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8),
                    child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text('Select Category'),
                      items: category.map((cat) {
                        return DropdownMenuItem(
                          child: Text(cat),
                          value: cat,
                        );
                      }).toList(),
                      value: selectCategory,
                      onChanged: (value) {
                        setState(() {
                          selectCategory = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: productName,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: productSerialNo,
                    decoration: InputDecoration(
                      labelText: 'Product Serial No.',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: GestureDetector(
                    onTap: _selectDate,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        // labelText: 'Purchase Date',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      child: selectedDate != null
                          ? Text(
                              _formatDate(selectedDate!),
                            )
                          : Text('Select Purchase Date'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8),
                    child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text('Select Category'),
                      items: [
                        DropdownMenuItem(
                            child: Text('Products'), value: 'Products'),
                      ],
                      onChanged: (value) {
                        setState(() {
                          value = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Warranty Card '),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: selectedImagePath.isNotEmpty
                              ? GestureDetector(
                                  onTap: () => _pickImage(1),
                                  child: Image.file(
                                    File(selectedImagePath),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: IconButton(
                                    icon: Icon(Icons.add_a_photo),
                                    onPressed: () => _pickImage(1),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Billing Card'),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: selectedImagePath2.isNotEmpty
                              ? Image.file(
                                  File(selectedImagePath2),
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: IconButton(
                                    icon: Icon(Icons.add_a_photo),
                                    onPressed: () => _pickImage(2),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Text('Warranty Card 3'),
                    //     Container(
                    //       height: 100,
                    //       width: 100,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //       child: selectedImagePath3.isNotEmpty
                    //           ? Image.file(
                    //               File(selectedImagePath3),
                    //               fit: BoxFit.cover,
                    //             )
                    //           : Center(
                    //               child: IconButton(
                    //                 icon: Icon(Icons.add_a_photo),
                    //                 onPressed: () => _pickImage(3),
                    //               ),
                    //             ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    controller: Remarks,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Remarks',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    updateCompData();
                  },
                  child: Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 212, 99, 33)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
