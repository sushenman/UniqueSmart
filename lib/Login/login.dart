import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:uniquesmart/Login/register.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Center(
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
          //-----------------------------------------Username---------------------------------------
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 49,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  labelText: 'Username',
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
          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromRGBO(242, 76, 39, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
          //-----------------------------------------Login Button---------------------------------------
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
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
              Text('OR', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ) ,),
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
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Register() ,));
            }, child: Text('Sign Up', style: TextStyle(
              color: Color.fromRGBO(242, 76, 39, 1),
              fontWeight: FontWeight.bold,
            ),))
          ],
        ),
        //-----------------------------------------Social Media---------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              
            //3 social media logos
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                color: const Color.fromARGB(255, 0, 0, 0)
              ) ,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(SocialMediaIcons.facebook, size: 30, color: Color.fromRGBO(255, 255, 255, 1),),
              ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 0, 0, 0) 
              ) ,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(SocialMediaIcons.instagram,size: 30, color: Color.fromRGBO(255, 255, 255, 1)),
              )
                       ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 0, 0, 0) 
              ) ,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(SocialMediaIcons.google,size: 30, color: Color.fromRGBO(255, 255, 255, 1)),
              )
                       ),
            ),
          ],
        )
        ]),
      ),
    );
  }
}
