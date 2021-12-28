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
            'Description About the App ',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 60,
      ),
      
      body: Column(
        children:const [
Text('tutor registration->tutor sustmail verification->tutorlogin->can see his profile->can see all students profile\n '),
Text('parents registration->parents mail verification->parentlogin->see his profile,add students,see his all students profile,see all tutors profile,and can call them')
        ], 
      ),
    );
  }
}
