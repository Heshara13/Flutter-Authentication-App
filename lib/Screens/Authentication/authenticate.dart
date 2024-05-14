import 'package:authentication/Screens/Authentication/register.dart';
import 'package:authentication/Screens/Authentication/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinPage = true;

  //toggle pages
  void switchPages() {
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinPage == true) {
      return SignIn(
        toggle: switchPages,
      );
    } else {
      return Register(
        toggle: switchPages,
      );
    }
  }
}
