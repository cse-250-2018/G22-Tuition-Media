import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuitionmedia/model/tutor_model.dart';

import 'browse_students.dart';

class LoggedInTutor extends StatefulWidget {
  LoggedInTutor();

  @override
  State<LoggedInTutor> createState() => _TutorsProfileState();
}

class _TutorsProfileState extends State<LoggedInTutor> {
  User? user = FirebaseAuth.instance.currentUser;
  TutorModel loggedInTutor = TutorModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('tutors')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInTutor = TutorModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  color: const Color(0x40FEDBD0),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 70,
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
                      loggedInTutor.tutorName!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      loggedInTutor.sustMail!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Tutor Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
