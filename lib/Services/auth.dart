import 'dart:async';

import 'package:authentication/Models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //firabase instance - to refer database
  // _auth - private variable
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //created firebase instance names _auth
  // create a user from firebase user with uid
  UserModel? _userwithFirebaseUseruid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // create the stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userwithFirebaseUseruid);
  }

  //sign in anonymous
  Future signinanonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userwithFirebaseUseruid(user);
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());
      return null;
    }
  }

  //register using email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userwithFirebaseUseruid(user);
    } catch (err) {
      (err.toString());
      return null;
    }
  }

  //sign in using email and password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userwithFirebaseUseruid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in using gmail
  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
