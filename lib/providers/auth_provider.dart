import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quantum_task/utils/constants.dart';
import 'package:quantum_task/utils/models/userModel.dart';
import 'package:quantum_task/widgets/loading.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../services/authServices.dart';

class AuthProvider extends ChangeNotifier {
  set auth(FirebaseAuth auth) {
    notifyListeners();
  }

  signUp(BuildContext context, UserModel user) async {
    if (user.name.isEmpty ||
        user.email.isEmpty ||
        user.password.isEmpty ||
        user.contact.isEmpty) {
      showGlobalSnackBar("Fields are empty");
    }
    showLoading(context);
    String result = await AuthMethods().signUpUser(
        name: user.name,
        email: user.email,
        password: user.password,
        contact: user.contact);
    hideLoading(context);
    if (result.contains("email-already-in-use")) {
      showGlobalSnackBar("Email address is already in use.");
    } else if (result != 'success') {
      log("signup message: result");
      showGlobalSnackBar(result);
      Navigator.pushReplacementNamed(context, HomeScreen.tag);
    } else {
      Navigator.pop(context);
    }
  }

  logInUser(BuildContext context, UserModel user) async {
    String email = user.email;
    String password = user.password;
    if (email.isEmpty || password.isEmpty) {
      showGlobalSnackBar("Fields are empty");
    }
    showLoading(context);
    String result = await AuthMethods().logInUser(
      email: email,
      password: password,
    );
    print(result);
    hideLoading(context);

    if (result == 'success') {
      Navigator.pushReplacementNamed(context, HomeScreen.tag);
    } else {
      showGlobalSnackBar(result);
    }
  }

  logout(BuildContext context) {
    AuthMethods().auth.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.tag);
  }
}
