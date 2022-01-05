import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuitionmedia/pages/tutor_profile.dart';

class BrowseTutors extends StatelessWidget {
  const BrowseTutors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('tutors').snapshots();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 20,
          //     child: Center(
          //       child: Text('Scroll to see the SliverAppBar in effect.'),
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );

//     SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Stack(
//           children: [
//             StreamBuilder<QuerySnapshot>(
//               stream: users,
//               builder: (
//                 BuildContext context,
//                 AsyncSnapshot<QuerySnapshot> snapshot,
//               ) {
//                 if (snapshot.hasError) {
//                   return const Center(child: Text("Something went wrong"));
//                 } else if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else {
//                   final data = snapshot.requireData;
//                   return ListView.builder(
//                     //to avoid error added next two line
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     itemCount: data.size,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 5,
//                         child: ListTile(
//                             title: Text(data.docs[index]['tutorName']),
//                             subtitle: Text(data.docs[index]['dept']),
//                             onTap: () async {
//                               final uid3 = data.docs[index]['uid2'];

//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => TutorsProfile(uid3)),
//                               );
//                             }),
//                       );
//                     },
//                   );
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
  }
}
