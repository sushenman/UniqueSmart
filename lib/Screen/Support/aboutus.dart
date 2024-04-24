import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:math' as math;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart'; // import this

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}

double value = 0;
late CarouselController controller;
final Duration duration = Duration(milliseconds: 300);
TextEditingController _name = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _phone = TextEditingController();
TextEditingController _message = TextEditingController();

int currentIndex = 0;
List<String> Title = [
  'Address',
  'Opening Hours',
  'Contact Us at',
  'Email',
  'Website'
];
List<String> Content = [
  'Location Name',
  'Monday - Friday: 10:00 - 18:00',
  'Phone: 01-1234567',
  'abc@abc.abc',
  'www.uniquesmart.com.np'
];
List<IconData> icons = [
  Icons.location_on,
  Icons.hourglass_bottom_sharp,
  Icons.phone,
  Icons.email,
  Icons.info,
];

class _aboutUsState extends State<aboutUs> {
  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  Widget buildAboutUsItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        // height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 0, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(''),
              Row(
                children: [
                  //display icon list
                  Icon(
                    icons[Title.indexOf(title)],
                    color: Colors.black,
                    size: 12,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  carouselimage() {
    return Container(
      child: CarouselSlider(
        carouselController: controller,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          //   autoPlayInterval: Duration(seconds: 2),
          //   autoPlayAnimationDuration: Duration(milliseconds: 2000),
          //  autoPlayCurve: Curves.fastOutSlowIn,
          // enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        items: [
          Container(
            height: MediaQuery.of(context).size.height,
            // color: Color.fromARGB(255, 243, 243, 243),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 350,
                  right: 0,
                  left: 0,
                  child: Center(
                      child: Text(
                    'About Us',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                ),
                // Positioned(
                //   bottom: 200,
                //   left: 0,
                //   right: 0,
                //   top: 00,
                //   child: Center(
                //     child: Image.asset(
                //       'assets/images/logof.png',
                //       fit: BoxFit.contain,
                //       // height: 200,
                //       width: MediaQuery.of(context).size.width * 0.5,
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 180,
                  bottom: 00,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Unique Smart is a leading online shopping platform in Nepal. We are a team of young, energetic and highly motivated individuals who strive to ensure the best service and products for our customers. We believe shopping should be fun and enjoyable, and we work hard to make sure you do!. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n \n Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            // decoration: BoxDecoration(color: Colors.amber),
            // width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height:170),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Our Contact Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                for (int index = 0; index < Title.length; index++)
                  Center(child: buildAboutUsItem(Title[index], Content[index])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: Text(
                        'Send us a message',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          controller: _name,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        style: TextStyle(fontSize: 14),
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        style: TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _phone,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      minLines: 8,
                      maxLines: 15,
                      controller: _message,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Submit button
                    ElevatedButton(
                      onPressed: () {
                        if (_name.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Please enter your name'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else if (_email.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Please enter your Email'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else if (_email.text.contains('@') == false) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Please enter your Email'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else if (_phone.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content:
                                      Text('Please enter your phone number'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else if (_phone.text.length < 10) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Enter a valid phone number'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else if (_message.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Please enter your Message'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => aboutUs()));

                                  // print(_name.text);
                                  createMessage(_name.text, _email.text, _phone.text, _message.text);
                        }
                      },
                      child: Text('Submit'),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10)),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(242, 76, 39, 1))),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void Sharecontent() {
   Share.share('check out my website https://example.com',
        subject: 'Look what I made!');
  }
Future<void> createMessage(
      String name, String email, String phone, String message) async {
    print('hello');
    final String apiUrl = "https://api.uniquesmartindustries.com/api/contacts";
    String apikey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';

    try {
      final response = await post(
        Uri.parse(apiUrl),
        body: {
          "name": name,
          "email": email,
          "phone_number": phone,
          "message": message
        },
        headers: {'apikey': apikey},
      );
      print(response.body);

      if (response.statusCode == 200) {
        print('Message sent');
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {

                print('h');
                Sharecontent();

                // Share.share('check out my website https://example.com',
                //     subject: 'Look what I made!');
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned(
                // bottom: 100,
                left: 0,
                right: 0,
                top: 0,
                child: Image.asset(
                  'assets/images/background1.png',
                  fit: BoxFit.fitWidth,
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                )),
            Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                // top:,

                child: Image.asset(
                  'assets/images/background2.png',
                  fit: BoxFit.fitWidth,
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 2,
                )),
            carouselimage(),
            Positioned(
                // top: 0,
                bottom: 0,
                left: 0,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //  Navigator.pop(context);
                      //  position: currentIndex;
                      controller.animateToPage(currentIndex - 1);
                    },
                  ),
                )),
            Positioned(
                // top: 0,
                bottom: 0,
                right: 0,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //  Navigator.pop(context);
                      //  position: currentIndex;
                      controller.animateToPage(currentIndex + 1);
                    },
                  ),
                )),
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 10,
            //   child: Center(
            //     child: DotsIndicator(
            //       dotsCount: 3,
            //       position: currentIndex,
            //       onTap: (index) {
            //         controller.animateToPage(index);
            //       },
            //       decorator: DotsDecorator(
            //         color: Color.fromRGBO(242, 76, 39, 1),
            //         activeColor: Color.fromARGB(255, 0, 0, 0),
            //         size: const Size.fromRadius(5.0),
            //         activeSize: const Size(39.0, 12.0),
            //         activeShape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12.0),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
         
          ],
        ));
  }
}

class Message {
  String name;
  String email;
  String phone;
  String message;
  Message(
      {required this.name,
      required this.email,
      required this.phone,
      required this.message});

      factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      message: json['message'],
    );
      
      }
}