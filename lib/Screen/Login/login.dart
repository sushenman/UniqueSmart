import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:uniquesmart/Screen/HomeScreen/landingdrawer.dart';
import 'package:uniquesmart/Screen/Login/passwordchange.dart';
import 'package:uniquesmart/Screen/Login/register.dart';
import 'package:uniquesmart/global.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:uniquesmart/Provider/authprovider.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthNotifier authNotifier;
    @override
  void initState() {
    super.initState();
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  }
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = false;


  String errorMessage = 'The email or password you entered is incorrect';
  void login(username, password) async {
    try {
      Uri url =
          Uri.parse('https://api.uniquesmartindustries.com/api/auth/login?email=$username&password=$password');
      Response response = await post(url, body: {
        'email': username,
        'password': password,
      });
      print(username);
      print(password);
      if (response.statusCode == 200) {
        //fetch the token
        var body = response.body;
        print(body);
        //fetch the token from the body
        var token = body.split('"')[3];
        print('abc + ${token}');
           authNotifier.setToken(token);
        print(response.body);
        if (response.body.contains('error')) {
            print('hello');
        } else {
        //  Navigator.pushNamed(context, routeName)
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => animatedDrawer(),
              ));
        }
      } else {
       
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ,));
           final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
         content: AwesomeSnackbarContent(
          title: 'Error' ,
          message: 'Invalid Credentials' ,
          contentType: ContentType.failure,
         ));
            ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Center(
        child:
         SingleChildScrollView(
           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //-----------------------------------------Logo---------------------------------------
            Container(
              child: Image.asset('assets/images/logof.png'),
            ),
         
            SizedBox(
              height: 40,
            ),
            //-----------------------------------------Login Text---------------------------------------
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Visibility(
            //     visible: isVisible,
            //     child: Padding(
            //       padding: EdgeInsets.only(top: 10),
            //       child: Text(
            //         errorMessage,
            //         style: TextStyle(
            //           color: Colors.red,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     )),
            //-----------------------------------------Username---------------------------------------
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 49,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: username,
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
            //-----------------------------------------Password---------------------------------------
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                height: 49,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: password,
                  obscureText: true,
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
            //-----------------------------------------Forgot Password---------------------------------------
            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       TextButton(
            //           onPressed: () {
            //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            //               return passwordChange();
            //             }));
            //           },
            //           child: Text(
            //             'Forgot Password?',
            //             style: TextStyle(
            //               color: Color.fromRGBO(242, 76, 39, 1),
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ))
            //     ],
            //   ),
            // ),
           
           //-----------------------------------------Login Button---------------------------------------
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  login(username.text.toString(), password.text.toString());
                },
                child: Text('Login',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 70.w, vertical: 10.h)),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(242, 76, 39, 1))),
              ),
            ),
            //-----------------------------------------Divider---------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //-----------------------------------------Sign up---------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromRGBO(242, 76, 39, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
            //-----------------------------------------Social Media---------------------------------------
            // SizedBox(
            //   height: 20,
                 
            // ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => animatedDrawer(),
                          ));
              } ,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text('Continue as guest', style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(242, 76, 39, 1),
                  fontWeight: FontWeight.bold,
                
                ),),
              ))
                 ]),
         ),
      ),
    );
  }
}
