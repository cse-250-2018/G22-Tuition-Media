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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
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
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loggedInUser.tutorName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // Text(
                        //   loggedInUser.sustMail!,
                        //   style: const TextStyle(
                        //     color: Colors.black54,
                        //     fontSize: 15,
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.brown[300],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      loggedInUser.sustMail!,
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      loggedInUser.mobileno!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call),
                      Text(
                        'Call Tutor',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    //call feature
                    var number =
                        '${loggedInUser.mobileno}'; //set the number here
                    bool? res =
                        await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    primary: Colors.brown[400], //background
                    // onPrimary: Colors.white, //foreground
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                  ),
                ),
                Divider(),
                SizedBox(
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
                      'Department: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.dept!),
                  ],
                ),
                SizedBox(
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.registrationNumber!),
                  ],
                ),
                SizedBox(
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.gender!),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
