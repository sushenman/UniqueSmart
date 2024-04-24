import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:uniquesmart/Screen/Support/paymentpolicy.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

List<String> titles = [
  'Can solar panels be installed in areas with limited sunlight?',
  'Can a water purifier make hard water soft?',
  'How much water can a water purifier filter in a day?',
  'How often should I replace the water filter in my purifier?',
  'Can the battery be used for both indoor and outdoor applications?',
  'How long does the battery typically last on a full charge?',
  'Can a solar battery power an entire house?'
];
List<String> desc = [
  'Solar panels can still generate electricity in areas with limited sunlight. However, their efficiency may be reduced compared to areas with ample sunlight.',
  'Most water purifiers focus on removing contaminants but do not alter water hardness. If you have hard water, a water softener or an ion exchange system may be more suitable to reduce the hardness by removing minerals like calcium and magnesium.',
  'The filtration capacity of a water purifier varies depending on the model and technology used. It is typically specified by the manufacturer and can range from a few liters to several gallons per hour. Refer to the product specifications or user manual for accurate information.',
  'The frequency of filter replacement depends on the type of filter and the water quality in your area. Generally, it is recommended to replace the filters every 6 months to 1 year. However, some advanced filters may have longer lifespans and require replacement every 2-3 years.',
  'Yes, the battery is versatile and can be used for both indoor and outdoor applications, providing portable power in various settings',
  'The battery\'s lifespan on a full charge varies depending on factors such as capacity and power consumption. It can last anywhere from a few hours to several days.',
  'Whether a solar battery can power an entire house depends on the size and capacity of the battery, as well as the energy needs of the household. A larger battery can store more energy and power more devices, but it may not be able to power an entire house for an extended period of time without recharging.'
];
List<bool> visibilityList = List.generate(titles.length, (index) => false);
TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _queryController = TextEditingController();

class _FaqsState extends State<Faqs> {
  // @override
  // void initState() {
  //   FAQ();
  //   super.initState();
  // }

  FAQ() async {
    //add the content of brands from api
    String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Uri url = Uri.parse('https://api.uniquesmartindustries.com/api/faqs');

    Map<String, String> headers = {
      'apikey': apiKey,
      // 'Content-Type': 'application/json',
    };
    print('hello');
if(_nameController.text.isEmpty || _emailController.text.isEmpty || _phoneController.text.isEmpty || _queryController.text.isEmpty){  
  final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Enter all the fields' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
}
else
{
 Response response = await http.post(url, headers: headers, body: {
      "name": _nameController.text,
      "email": _emailController.text,
      "phone_number": _phoneController.text,
      "question": _queryController.text
    });
    if (response.statusCode == 200) {
      
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _queryController.clear();
       final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Success' ,
          message: ' Query Submitted Successfully' ,
          contentType: ContentType.success,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => Faqs()));
    print(response.body);
}
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'FAQs',
          style: TextStyle(color: Colors.black),
        ),

        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(232, 236, 245, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(232, 236, 245, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: const Text(
                    'Full Name',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        //  hintText: 'Enter your Full Name',
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        //  hintText: 'Enter your Full Name',
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: const Text(
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        //  hintText: 'Enter your Full Name',
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: const Text(
                    'Query',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _queryController,
                    maxLines: 8,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 0, 0)),
                          minimumSize: MaterialStateProperty.all(
                            Size(200, 36),
                          )),
                      onPressed: () {
                        FAQ();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ))),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Column(
                      children: [
                        Container(
                   width: MediaQuery.of(context).size.width ,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(236, 83, 35, 1))),
                            onPressed: () {
                              setState(() {
                                visibilityList[index] = !visibilityList[index];
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '${titles[index]}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: visibilityList[index] ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            height: visibilityList[index] ? null : 10.0,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${desc[index]}',
                                textAlign: TextAlign.justify,
                                style:
                                    TextStyle(fontSize: 14, letterSpacing: 1),
                              ),
                            ),
                          ),
                          // visible: visibilityList[index],
                        )
                      ],
                    ),
                  );
                },
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}

class FaqModel {
  final String name;
  final String email;
  final String Phone_number;
  final String question;

  FaqModel(
      {required this.name,
      required this.email,
      required this.Phone_number,
      required this.question});

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
        name: json['name'],
        email: json['email'],
        Phone_number: json['Phone_number'],
        question: json['question']);
  }
}
