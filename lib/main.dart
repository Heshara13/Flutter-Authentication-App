import 'package:authentication/Models/usermodel.dart';
import 'package:authentication/wrapper.dart';
import 'package:authentication/Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyC-hDN70gBk7pKSYKQyuP3o1PQ7iZlTb_4',
          appId: '1:478848027169:android:5952771db89e0f3de6f160',
          messagingSenderId: '478848027169',
          projectId: 'authentication-app-f3cb8'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: "null"),
      value: AuthServices().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
