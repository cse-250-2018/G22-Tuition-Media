import 'package:flutter/material.dart';

class TutorScreen extends StatelessWidget {
  final tutorsName;
  final dept;
  final List<String> subject;
  final gender;
  bool interested;
  TutorScreen(
      {required this.tutorsName,
      required this.dept,
      required this.subject,
      required this.gender,
      this.interested = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$tutorsName's profile"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.person),
                Text(
                  tutorsName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Text(
              "Department : $dept",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Preferred Subjects"),
            Divider(),
            ...subject.map((e) => Text(e)).toList(),
          ],
        ),
      ),
    );
  }
}
