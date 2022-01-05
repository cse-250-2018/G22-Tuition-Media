// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tuitionmedia/model/student_model.dart';
import 'package:tuitionmedia/model/tutor_model.dart';
import 'package:tuitionmedia/model/user_model.dart';
import 'package:tuitionmedia/student_registration.dart';

class LoggedInParent extends StatefulWidget {
  const LoggedInParent({Key? key}) : super(key: key);

  @override
  State<LoggedInParent> createState() => _LoggedInParentState();
}

class _LoggedInParentState extends State<LoggedInParent> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();
  List<StudentModel> std = [];
  String name = '';

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
      name = loggedInUser.parentName!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Stream<QuerySnapshot> tutor =
    // FirebaseFirestore.instance.collection('tutors').doc();
    print('build');

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 110,
            ),
            Row(
              children: [
                Container(
                  color: const Color(0x40FEDBD0),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 60,
                    color: Colors.brown[900],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      loggedInUser.email!,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black26,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Add a Student'),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentRegistration(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  primary: Colors.brown, //background
                  onPrimary: Colors.white, //foreground
                  elevation: 0,
                  padding: EdgeInsets.all(10)),
            ),
          ],
        ),
      ),
    );
  }
}
