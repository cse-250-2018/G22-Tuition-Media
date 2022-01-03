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

      // in this container we added some sizedbox for button
        body: Container(
            
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //this row contains Parent's new student registration
        Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: MediaQuery. of(context). size. height/3,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  //refers to StudentRegistration page
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

            //this button refres to this parents all students profile
            Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
              height: MediaQuery. of(context). size. height/3,
              width: MediaQuery. of(context). size. width,
              child: ElevatedButton(
                onPressed: () {
                  //refers to MyAllStudents scene
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

            //this widget refers to AllAvailable tutors profile
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
