import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('tutors').snapshots();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {})
        ],
        title: const Center(
          child: Text(
            'All Tutor\'s Profile ',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 90,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: StreamBuilder<QuerySnapshot>(
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
                      print(data);
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
                                onTap: () {
                                  print(data.docs[index]['uid2']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TutorsProfile(
                                              data.docs[index]['uid2'])));
                                }),
                          );
                          //return Text(' ${data.docs[index]['tutorName']} and mobileno ${data.docs[index]['mobileno']}');
                          // return SingleChildScrollView(
                          //   child: Container(
                          //       child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Tutor\'s Name :  ${data.docs[index]['tutorName']}',
                          //         style: const TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         height: 5,
                          //       ),
                          //       Text(
                          //         'Tutor\'s Department :  ${data.docs[index]['dept']}',
                          //         style: const TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         height: 5,
                          //       ),
                          //       Text(
                          //         'Tutor\'s Gender :  ${data.docs[index]['gender']}',
                          //         style: const TextStyle(
                          //           fontSize: 20,
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         height: 5,
                          //       ),
                          //       Text(
                          //         'Tutor\'s Mail :  ${data.docs[index]['sustMail']}',
                          //         style: const TextStyle(
                          //           fontSize: 20,
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         height: 5,
                          //       ),

                          //       Row(
                          //         children: [
                          //           ElevatedButton(
                          //             onPressed: () async {
                          //               //call feature
                          //                var number =
                          //                    '${data.docs[index]['mobileno']}'; //set the number here
                          //               bool? res = await FlutterPhoneDirectCaller
                          //                   .callNumber(number);
                          //             },
                          //             style: ElevatedButton.styleFrom(
                          //               textStyle: const TextStyle(fontSize: 20),
                          //               primary: Colors.black12, //background
                          //               onPrimary: Colors.white, //foreground

                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 30),
                          //             ),
                          //             child: (const Text('Call Tutor')),
                          //           )
                          //         ],
                          //       ),
                          //       const SizedBox(
                          //         height: 30,
                          //       ),
                          //     ],
                          //   )),
                          // );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
