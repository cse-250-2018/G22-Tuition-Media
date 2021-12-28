import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

///
///
///eine tui kaj kor


class TutorsProfile extends StatefulWidget {
  const TutorsProfile({Key? key}) : super(key: key);

  @override
  _TutorsProfileState createState() => _TutorsProfileState();
}

class _TutorsProfileState extends State<TutorsProfile> {
  late final String documentId;

 
  @override
  Widget build(BuildContext context) {
    
      CollectionReference users= FirebaseFirestore.instance.collection('tutors');

        
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return const Text("loading");
      },
    );
  }
}
