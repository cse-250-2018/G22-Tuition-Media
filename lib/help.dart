import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({Key? key}) : super(key: key);

  @override
  _NeedHelpState createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Center(
          child: Text(
            'A Brief Description\n About this App ',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 130,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('This App\'s name is SUSTian Tuition Media.\n',
              style: TextStyle(
              fontSize: 18,
              ),
              
              ),
              Text('Here one will only find SUSTian Tutors,Here Tutor can Search for Tuition and Parents can search for tutor as their requirement\n',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16,
              ),
              ),
              Text('**How Parents will use this App???\n',
              style: TextStyle(
                fontSize: 19,
              ),
              
              ),

              Text('=> \t First one have to do is registration.In registration page he/she have provide some information like name,email,mobileNo,password.For security issu one need to add a sustmail student mail \n',
              style: TextStyle(
                fontSize: 19,
              ),
              
              ),

              Text(
                  'tutor registration->tutor sustmail verification->tutorlogin->can see his profile->can see all students profile\n '),
              Text(
                  'parents registration->parents mail verification  ->parentlogin->see his profile,add students,see his all students profile,see all tutors profile,and can call them'),
            ],
          ),
        ),
      ),
    );
  }
}
