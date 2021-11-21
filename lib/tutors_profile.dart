import 'package:flutter/material.dart';
class TutorsProfile extends StatefulWidget {
  const TutorsProfile({ Key? key }) : super(key: key);

  @override
  _TutorsProfileState createState() => _TutorsProfileState();
}

class _TutorsProfileState extends State<TutorsProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Center(
          child: Text(
            'TUi eine profile er title e ja rakha drkr add koribi',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 150,
      ),
    );
  }
}