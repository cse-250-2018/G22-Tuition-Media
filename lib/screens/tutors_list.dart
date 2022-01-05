import 'package:flutter/material.dart';
import 'package:tuitionmedia/demo/demo_tutor.dart';
import 'package:tuitionmedia/screens/tutor_profile_screen.dart';

class TutorList extends StatefulWidget {
  const TutorList({Key? key}) : super(key: key);

  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutors'),
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: tutors
              .map((entry) => Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(entry.tutorsName),
                      subtitle: Text(entry.dept),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutorScreen(
                                  tutorsName: entry.tutorsName,
                                  dept: entry.dept,
                                  subject: entry.subject,
                                  gender: entry.gender),
                            ));
                      },
                    ),
                  ))
              .toList(),
        ),
      )),
    );
  }
}
