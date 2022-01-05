import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tuitionmedia/model/tutor_model.dart';

import 'browse_students.dart';

class TutorsProfile extends StatefulWidget {
  final String uid;

  TutorsProfile(this.uid);

  @override
  State<TutorsProfile> createState() => _TutorsProfileState();
}

class _TutorsProfileState extends State<TutorsProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  TutorModel loggedInUser = TutorModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('tutors')
        .doc(widget.uid)
        .get()
        .then((value) {
      loggedInUser = TutorModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Stream<QuerySnapshot> tutor =
    // FirebaseFirestore.instance.collection('tutors').doc();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[900],
          //omuk's profile
          title: const Text(
            'Omuk\'s profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    color: Colors.brown[900],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
