import 'package:flutter/material.dart';
import 'package:tuitionmedia/pages/browse_students.dart';

class TutorProfilePage extends StatelessWidget {
  final String uid;

  const TutorProfilePage(this.uid);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('See all students'),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const BrowseStudents(),
          ),
        ),
      ),
    );
  }
}
