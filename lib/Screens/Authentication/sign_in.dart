// ignore_for_file: avoid_print

import 'package:authentication/constants/colors.dart';
import 'package:authentication/constants/description.dart';
import 'package:authentication/constants/styles.dart';
import 'package:flutter/material.dart';
import '../../Services/auth.dart';

class SignIn extends StatefulWidget {
  //function
  final Function toggle;
  const SignIn({super.key, required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //ref for the Authservices class
  final AuthServices _auth = AuthServices();

  //form key
  final _formkey = GlobalKey<FormState>();
  //email password states
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
            backgroundColor: bgBlack,
            title: const Text(
              "SIGN IN",
              style: TextStyle(color: Colors.white),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [
                const Text(
                  description,
                  style: descriptionStyle,
                ),
                Center(
                    child: Image.asset(
                  "images/Ellipse 11.png",
                  height: 150,
                )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: textInputDecoration,
                          validator: (val) => val?.isEmpty == true
                              ? "Enter a valid email"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //password
                        TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: textInputDecoration.copyWith(
                              hintText: "Password"),
                          validator: (val) =>
                              val!.length < 6 ? "Enter a valid password" : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                        //google
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Login with social accounts",
                          style: descriptionStyle,
                        ),
                        GestureDetector(
                          //sign in with google
                          onTap: () {},
                          child: Center(
                              child: Image.asset(
                            "images/google.png",
                            height: 50,
                          )),
                        ),
                        const SizedBox(height: 20),
                        //register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do not have an account?",
                              style: descriptionStyle,
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              //go to the register page
                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "REGISTER",
                                style: TextStyle(
                                    color: mainBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        //button
                        const SizedBox(
                          height: 20,
                        ),

                        GestureDetector(
                          // method for login user
                          onTap: () async {
                            dynamic result = _auth.signInUsingEmailAndPassword(
                                email, password);

                            if (result == null) {
                              setState(() {
                                error =
                                    "could not signin with those credentials";
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: bgBlack,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 2, color: mainYellow)),
                            child: const Center(
                                child: Text(
                              "LOG IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          // method for login user as anon
                          onTap: () async {
                            await _auth.signinanonymously();
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: bgBlack,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 2, color: mainYellow)),
                            child: const Center(
                                child: Text(
                              "LOG IN as a Guest",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        )
                        //anno
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
//  ElevatedButton(
//         child: const Text("Sign in Anonymously"),
//         onPressed: () async {
//           dynamic result = await _auth.signinanonymously();
//           if (result == null) {
//             print("error in signing anoni");
//           } else {
//             print("sign in anoni");
//             print(result.uid);
//           }
//         },
//       ),
