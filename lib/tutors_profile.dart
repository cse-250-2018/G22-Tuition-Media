import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class TutorsProfile extends StatefulWidget {
  const TutorsProfile({Key? key}) : super(key: key);

  @override
  _TutorsProfileState createState() => _TutorsProfileState();
}

class _TutorsProfileState extends State<TutorsProfile> {
  @override
  Widget build(BuildContext context) {
    
        
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Center(
          child: Text(
            'Your Profile ',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: const [
              Text(
                'Here will be all data of this Tutor  ',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
