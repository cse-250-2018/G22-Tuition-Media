import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/parent_registration.dart';

class RefferedMailVerification extends StatefulWidget {
  const RefferedMailVerification({Key? key}) : super(key: key);

  @override
  _RefferedMailVerificationState createState() =>
      _RefferedMailVerificationState();
}

class _RefferedMailVerificationState extends State<RefferedMailVerification> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    //set time duration after which it will check link is pressed or not
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'An email has been sent, please verify',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //sending link to email
  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;

    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      auth.currentUser!.delete();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ParentRegistration()),
      );
    }
  }
}
