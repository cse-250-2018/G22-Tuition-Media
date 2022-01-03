import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AllTutorsProfile extends StatelessWidget {
  const AllTutorsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('tutors').snapshots();

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Center(
          child: Text(
            'All Tutor\'s Profile ',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 60,
      ),
      ///side e j container deya ache 30 size er oi area te scroll kaj korbe
      //added single child scrollView so that we can scroll this page.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
      //here we showed every tutor's data and what it contains of
      //every tutors profile contains name,dept,mobileno,ex-college name,gender,sustmail
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
                      return SingleChildScrollView(
                        child: ListView.builder(
                          //to avoid error added next two line
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            //return Text(' ${data.docs[index]['tutorName']} and mobileno ${data.docs[index]['mobileno']}');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              'Tutor\'s Name :  ${data.docs[index]['tutorName']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tutor\'s College Name :  ${data.docs[index]['tutorsCollegeName']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tutor\'s Department :  ${data.docs[index]['dept']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tutor\'s Gender :  ${data.docs[index]['gender']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tutor\'s Mail :  ${data.docs[index]['sustMail']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            
                            //added mobile no but we haven't showed it,we implemented call featue here
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    //call feature
                                     var number =
                                         '${data.docs[index]['mobileno']}'; //set the number here
                                    bool? res = await FlutterPhoneDirectCaller
                                        .callNumber(number);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    primary: Colors.black12, //background
                                    onPrimary: Colors.white, //foreground

                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                  ),
                                  child: (const Text('Call Tutor')),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                              ],
                            );
                          },
                        ),
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