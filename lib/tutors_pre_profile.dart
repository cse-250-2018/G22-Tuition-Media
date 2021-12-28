import 'package:flutter/material.dart';
import 'package:tuitionmedia/alltutorsprofile.dart';
import 'package:tuitionmedia/allstudentsprofile.dart';
import 'package:tuitionmedia/student_registration.dart';
import 'package:tuitionmedia/tutors_profile.dart';

class TutorsPreProfile extends StatefulWidget {
  const TutorsPreProfile({Key? key}) : super(key: key);

  @override
  _TutorsPreProfileState createState() => _TutorsPreProfileState();
}

class _TutorsPreProfileState extends State<TutorsPreProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            /*decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/leaf.jpg"),
              fit: BoxFit.cover,
            )),*/
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: MediaQuery. of(context). size. height/2,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorsProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  //alignment: Alignment.center,
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.teal, //background
                  onPrimary: Colors.white, //foreground

                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: (const Text('See your own profile')),
              )),
        ]
            //mainAxisAlignment: MainAxisAlignment.start,
            ),
            
            Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: MediaQuery. of(context). size. height/2,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllStudentsProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  //alignment: Alignment.center,
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.blue, //background
                  onPrimary: Colors.white, //foreground

                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: (const Text('See all Available Student\'s List ')),
              )),
        ]
            //mainAxisAlignment: MainAxisAlignment.start,
            ),
      ],
    )));
  }
}
