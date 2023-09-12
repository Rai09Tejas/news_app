import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String name;
  final String uid;
  final String contact;
  final String password;

  UserModel(
      {required this.email,
      required this.name,
      required this.contact,
      required this.uid,
      required this.password,});

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "name": name,
        "contact": contact,
        "password": password,
      };

  static UserModel? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      contact: snapshot['contact'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      password: snapshot['password'],
      email: snapshot['email'],
    );
  }
}
