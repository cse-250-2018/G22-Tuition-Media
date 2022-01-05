import 'package:flutter/material.dart';
import 'package:tuitionmedia/pages/browse_students.dart';
import 'package:tuitionmedia/pages/initial_page.dart';
import 'package:tuitionmedia/pages/parent_profile.dart';
import 'package:tuitionmedia/student_registration.dart';

import 'browse_tutor_for_parent.dart';
import 'browse_tutors.dart';
import 'help_screen.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  AppHomeState createState() => AppHomeState();
}

class AppHomeState extends State<ParentPage> {
  int currentIndex = 0;
  final screens = [
    LoggedInParent(),
    BrowseTutorForParent(),
    StudentRegistration(),
  ];
  AppHomeState();

  // List<Meeting> specialEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        elevation: 15,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'T&A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Add Student',
          ),
        ],
      ),
    );
  }
}
