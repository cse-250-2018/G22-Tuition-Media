import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class TutorsProfile extends StatefulWidget {
  const TutorsProfile({Key? key}) : super(key: key);

  @override
  _TutorsProfileState createState() => _TutorsProfileState();
}

class _TutorsProfileState extends State<TutorsProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      
      body:Container(

      ),
      /*body: (ElevatedButton(
        onPressed: () async{
          //call feature
          const number = '01750829140'; //set the number here
         bool? res = await FlutterPhoneDirectCaller.callNumber(number);
        },
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          primary: Colors.black12, //background
          onPrimary: Colors.white, //foreground

          padding: const EdgeInsets.symmetric(horizontal: 30),
        ),
        child: (const Text('call')),
      )),*/
    );
  }
}
