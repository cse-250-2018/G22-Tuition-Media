// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tuitionmedia/pages/browse_students.dart';
import 'package:tuitionmedia/pages/browse_tutors.dart';
import 'package:tuitionmedia/pages/loggedin_tutor.dart';
import 'package:tuitionmedia/pages/start_page.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  AppHomeState createState() => AppHomeState();
}

class AppHomeState extends State<AppHome> {
  int currentIndex = 0;
  final screens = [
    LoggedInTutor(),
    BrowseStudents(),
    BrowseTutors(),
  ];
  AppHomeState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey[800],
        // selectedItemColor: Colors.white,
        // showUnselectedLabels: false,
        currentIndex: currentIndex,
        elevation: 15,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'My Profile',
              backgroundColor: Colors.blueAccent),
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'See Tutors',
          ),
        ],
      ),
    );
  }
}
