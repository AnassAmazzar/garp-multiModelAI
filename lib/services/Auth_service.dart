import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {

  static Future<void> signUp({
    required String email,
    required String password,
  }) async{

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      String message="";
      if(e.code == 'weak-password'){
        message = "The password provided is too weak.";
      }else if(e.code == 'email-already-in-use'){
        message = "An account already exists with the email.";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0
        );
    }

  }

  static Future<void> signIn({
    required String email,
    required String password,
  }) async{

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      String message="";
      if(e.code == 'user-not-found'){
        message = "No user found for that email";
      }else if(e.code == 'wrong-password'){
        message = "Wrong password provided for that user.";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0
        );
    }

  }

  static Future<void> signOut() async{

    try{
      await FirebaseAuth.instance.signOut();

    } on FirebaseAuthException catch(e){
      String message="${e}";
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0
        );
    }

  }


}