import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tuitionmedia/model/student_model.dart';
import 'package:tuitionmedia/model/tutor_model.dart';

import 'browse_students.dart';

//this class will show all students profile

class StudentProfile extends StatefulWidget {
  final String uid;

  StudentProfile(this.uid);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  StudentModel loggedInUser = StudentModel();

  @override
  void initState() {
    super.initState();
// set connection with firebase firestore
    FirebaseFirestore.instance
        .collection('students')
        .doc(widget.uid)
        .get()
        .then((value) {
      loggedInUser = StudentModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                //added avatar icon
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

                    //added students name here
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loggedInUser.studentName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.call),
                      Text(
                        'Call',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    //added call feature
                    var number =
                        '${loggedInUser.addMobileNo}'; //set the number here
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

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Student Info',
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

                //here we showed all data what we got from students at the time of registration

                Row(
                  children: [
                    Text(
                      'Class:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.studentClass!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Medium:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.medium!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Student\'s Group:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.group!),
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
                    Text(loggedInUser.studentGender!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Subjects:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.subjects!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Tutoring days in a Week:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.tutoringDays!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Salary want to give:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.salary!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Students Address:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.location!),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Other requirements:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[400],
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(loggedInUser.parentsDemand!),
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
