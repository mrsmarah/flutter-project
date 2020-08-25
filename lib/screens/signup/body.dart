import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login/login.dart';
import 'package:flutter_app/screens/signup/background_signup.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/components/input.dart';
import 'package:flutter_app/components/password.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}