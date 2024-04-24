import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniquesmart/Screen/Login/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool obscurePassword = true;
  bool obscureCPassword = true;

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
                  controller: name,
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
                  controller: email,
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
                  obscureText: obscurePassword,
                  controller: password,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('Enter the same password as above, for verification.',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  obscureText: obscureCPassword,
                  controller: confirmPassword,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureCPassword = !obscureCPassword;
                        });
                      },
                      icon: Icon(obscureCPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
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
                onPressed: () {
                  registerPage(name.text, email.text, password.text,
                      confirmPassword.text);
                },
                child: Text('Register', style: TextStyle(color: Colors.white)),
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

  Future<void> registerPage(name, email, password, confirmPassword) async {
    try {
      Uri Url = Uri.parse(
          'https://api.uniquesmartindustries.com/api/auth/register?name=$name&email=$email&password=$password&password_confirmation=$confirmPassword');
      Response response = await post(Url, body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      });

      if (response.statusCode == 200) {
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: AwesomeSnackbarContent(
              title: 'Success',
              message: 'Account created successfully',
              contentType: ContentType.success,
            ));
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        });
        print('success');
      } else {
        print(response.body);
        var errorName = response.body.split('"')[3];
        print('error name = $errorName');
        print('failed');
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: '$errorName',
              contentType: ContentType.failure,
            ));
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      // print(e);
    }
  }
}
