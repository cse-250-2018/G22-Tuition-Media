import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tuitionmedia/model/tutor_model.dart';
import 'package:tuitionmedia/model/user_model.dart';

class LoggedInParent extends StatefulWidget {
  const LoggedInParent({Key? key}) : super(key: key);

  @override
  State<LoggedInParent> createState() => _LoggedInParentState();
}

class _LoggedInParentState extends State<LoggedInParent> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    print(user!.uid);

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      print(loggedInUser.parentName);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Stream<QuerySnapshot> tutor =
    // FirebaseFirestore.instance.collection('tutors').doc();

    return Container(child: Text(loggedInUser.parentName!));
  }
}
