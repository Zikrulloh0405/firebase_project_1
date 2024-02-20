import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_1/pages/home_page.dart';
import 'package:firebase_project_1/widgets/all_widgets.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<User?> registerUser(BuildContext context,
      {required String name,
      required String emailAddress,
      required String password}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress, password: password);
    try {
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, HomePage.id);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: textWidget(textInput: 'Registered')));
      }
      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: textWidget(textInput: e.toString())));
      return null;
    }
  }
  

}
