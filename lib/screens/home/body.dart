import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login/login.dart';
import 'package:flutter_app/screens/signup/signup.dart';
import 'package:flutter_app/screens/home/home.dart';
import 'package:flutter_app/screens/home/background_home.dart';
import 'package:flutter_app/components/button.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'Welcome',
                style: TextStyle(
//                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            RoundedButton(
              text: "HOME",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "LOG IN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}