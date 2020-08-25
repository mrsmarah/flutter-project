import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login/background_login.dart';
import 'package:flutter_app/screens/signup/signup.dart';
//import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/components/input.dart';
import 'package:flutter_app/components/password.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOG IN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}