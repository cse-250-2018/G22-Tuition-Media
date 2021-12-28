import 'package:flutter/material.dart';
import 'package:tuitionmedia/alltutorsprofile.dart';
import 'package:tuitionmedia/myallstudents.dart';
import 'package:tuitionmedia/student_registration.dart';

class ParentsPage extends StatefulWidget {
  const ParentsPage({Key? key}) : super(key: key);

  @override
  _ParentsPageState createState() => _ParentsPageState();
}

class _ParentsPageState extends State<ParentsPage> {
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
              height: MediaQuery. of(context). size. height/3,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentRegistration()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  //alignment: Alignment.center,
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.teal, //background
                  onPrimary: Colors.white, //foreground

                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: (const Text('Add new student')),
              )),
        ]
            //mainAxisAlignment: MainAxisAlignment.start,
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: MediaQuery. of(context). size. height/3,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      
                        builder: (context) => const MyAllStudents()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  //alignment: Alignment.center,
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.pinkAccent, //background
                  onPrimary: Colors.white, //foreground

                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: (const Text('See all my student\'s List')),
              )),
        ]
            //mainAxisAlignment: MainAxisAlignment.start,
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: MediaQuery. of(context). size. height/3,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllTutorsProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  //alignment: Alignment.center,
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.blue, //background
                  onPrimary: Colors.white, //foreground

                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: (const Text('See all Available Tutor\'s List ')),
              )),
        ]
            //mainAxisAlignment: MainAxisAlignment.start,
            ),
      ],
    )));
  }
}
