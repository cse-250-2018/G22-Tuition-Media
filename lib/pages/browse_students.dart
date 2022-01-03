import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuitionmedia/pages/tutor_profile.dart';

class BrowseStudents extends StatelessWidget {
  const BrowseStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> students =
        FirebaseFirestore.instance.collection('students').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: students,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final data = snapshot.requireData;
          return Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: ListView.builder(
                //to avoid error added next two line
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                        title: Text(data.docs[index]['studentName']),
                        subtitle: Text(data.docs[index]['studentClass']),
                        onTap: () async {}),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
