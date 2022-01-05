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
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
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
                  const SizedBox(
                    width: 30,
                  ),
                  const SizedBox(
                    height: 20,
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
                      // Text(
                      //   loggedInTutor.sustMail!,
                      //   style: const TextStyle(
                      //     color: Colors.black54,
                      //     fontSize: 15,
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
              const Divider(),

              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.brown[300],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.sustMail!,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    color: Colors.brown[300],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.mobileno!,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Tutor Info',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 20),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.black26,
              ),
              Row(
                children: [
                  Text(
                    'Dept: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[400],
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.dept!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Registration no:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[400],
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.registrationNumber!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[400],
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.gender!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              //added location ,experience,group
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Group:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[400],
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.groupofTutor!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Experience:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[400],
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.experience!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Address:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[400],
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    loggedInTutor.tutorsAddress!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
