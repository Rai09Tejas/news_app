import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/models/userModel.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;

  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
    required String? contact,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password!);
        print(user.user!.uid);

        UserModel userModel = UserModel(
          email: email,
          name: name!,
          uid: user.user!.uid,
          contact: contact!,
          password: password,
        );

        await _firestore.collection('users').doc(user.user!.uid).set(
              userModel.toJson(),
            );
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
