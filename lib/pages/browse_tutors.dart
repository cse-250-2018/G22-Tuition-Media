import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tuitionmedia/pages/tutor_profile.dart';

class BrowseTutors extends StatelessWidget {
  const BrowseTutors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('tutors').snapshots();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: users,
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: Text("Loading"));
                } else {
                  final data = snapshot.requireData;
                  return ListView.builder(
                    //to avoid error added next two line
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(data.docs[index]['tutorName']),
                          subtitle: Text(data.docs[index]['dept']),
                          // onTap: () => Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           TutorsProfile(data.docs[index]['uid2'])),
                          // ),
                        ),
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
