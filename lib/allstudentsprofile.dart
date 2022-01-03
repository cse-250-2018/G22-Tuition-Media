import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AllStudentsProfile extends StatelessWidget {
  const AllStudentsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('students').snapshots();

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Center(
          child: Text(
            'All student\'s Profile ',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(

                //showed every students profile in this page,it consists Name,
                //Gender,Group,Medium,class,mobileno,salary,location

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
                            
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              // by this $ sign,we have bouhgt data from firebase firestore,and showed inside of a string
                              'Students\'s Name :  ${data.docs[index]['studentName']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Student\'s Gender :  ${data.docs[index]['studentGender']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Medium :  ${data.docs[index]['medium']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Group :  ${data.docs[index]['group']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Class :  ${data.docs[index]['studentClass']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Subject to be taught :  ${data.docs[index]['subjects']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Days in a week :  ${data.docs[index]['tutoringDays']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Parents Demand :  ${data.docs[index]['parentsDemand']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'salary :  ${data.docs[index]['salary']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Location :  ${data.docs[index]['location']}',
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
                                         '${data.docs[index]['addMobileNo']}'; //set the number here
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
                                  child: (const Text('Call student')),
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