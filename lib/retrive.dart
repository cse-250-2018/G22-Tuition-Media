import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class RetrivingData extends StatelessWidget {
  const RetrivingData({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('tutors').snapshots();
     
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: StreamBuilder<QuerySnapshot>(stream: users,
            builder:(
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,)
              {
              if(snapshot.hasError)
              {
                return const Text("Something went wrong");
              }
              else if(snapshot.connectionState == ConnectionState.waiting)
              {
                return const Text('Loading');
              }
              else{
              final data = snapshot.requireData;
              return ListView.builder(
                //to avoid error added next two line
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.size, 
                itemBuilder: ( context,  index) {
                  print(data.docs[index]['sustMail']);

                  return Text(' ${data.docs[index]['tutorName']} and mobileno ${data.docs[index]['mobileno']}');
                 },
                );
              }
            },
            )
                ,)
            ],
          ),
        ),
      ),
    );
  }
  }