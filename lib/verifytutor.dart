import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/parent_login.dart';
import 'package:tuitionmedia/tutor_login.dart';
class SustMailVerify extends StatefulWidget {
  const SustMailVerify({ Key? key }) : super(key: key);

  @override
  _SustMailVerifyState createState() => _SustMailVerifyState();
}

//verified email by sending a link,if pressed that link,then email will be verified.
class _SustMailVerifyState extends State<SustMailVerify> {
    final auth = FirebaseAuth.instance;
  late User user ;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
    //added timer to check link is pressed or not
    timer= Timer.periodic(const Duration(seconds:2), (timer) { 
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
    return  Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.teal,
        toolbarHeight: 100,
      ),
      backgroundColor: Colors.teal,
      body: const Center(
        child: Text('An email has been sent, please verify',
        style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        )
      ),
    );
  }
  //sending link to given sust mail
  Future<void> checkEmailVerified() async{
    user =auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      
      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TutorLogin()),
                  );

    }
  }
}