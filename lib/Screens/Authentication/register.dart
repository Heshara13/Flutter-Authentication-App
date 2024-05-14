import 'package:authentication/Services/auth.dart';
import 'package:authentication/constants/colors.dart';
import 'package:authentication/constants/description.dart';
import 'package:authentication/constants/styles.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              "Register",
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
                          height: 20,
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
                        //google
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
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
                                "LOG IN",
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
                          // method for login
                          onTap: () async {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = "Please enter a valid email";
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
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
