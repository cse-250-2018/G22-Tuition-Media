// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuitionmedia/pages/tutor_profile.dart';

import 'student_profile.dart';

class BrowseStudents extends StatelessWidget {
  const BrowseStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> students =
        FirebaseFirestore.instance.collection('students').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: students,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final data = snapshot.requireData;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Available Students',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.brown,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    SingleChildScrollView(
                      child: ListView.builder(
                        //to avoid error added next two line
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            child: ListTile(
                              leading: Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.brown[100],
                              ),

                              title: Text(
                                data.docs[index]['studentName'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  Text(data.docs[index]['subjects']),
                                  Text(data.docs[index]['studentClass'])
                                ],
                              ),

                              isThreeLine: true,
                              trailing: ElevatedButton(
                                child: Icon(Icons.call),
                                // ignore: avoid_print
                                onPressed: () async {
                                  //call feature
                                  var number =
                                      '${data.docs[index]['addMobileNo']}'; //set the number here
                                  bool? res =
                                      await FlutterPhoneDirectCaller.callNumber(
                                          number);
                                },
                              ),
                              // Text(data.docs[index]['studentClass']),
                              onTap: () async {
                                final uid3 = data.docs[index]['uid3'];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StudentProfile(uid3)),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
