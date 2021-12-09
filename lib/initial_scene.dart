import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/parent_login.dart';
import 'package:tuitionmedia/parent_registration.dart';
import 'package:tuitionmedia/tutor_login.dart';
import 'package:tuitionmedia/tutor_registration.dart';

class InitialScene extends StatefulWidget {
  const InitialScene({Key? key}) : super(key: key);

  @override
  _InitialSceneState createState() => _InitialSceneState();
}

class _InitialSceneState extends State<InitialScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Welcome to SUSTian  Media',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 150,
      ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/leaf.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ParentLogin()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              //alignment: Alignment.center,
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground

                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                            ),
                            child: (const Text('Log In as Parent')),
                          )),
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TutorLogin()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground

                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                            ),
                            child: (const Text('Log In as Tutor')),
                          )),
                    ]
                    //mainAxisAlignment: MainAxisAlignment.start,

                    ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ParentRegistration()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground

                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                            ),
                            child: (const Text('Register as Parent')),
                          )),
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TutorRegistration()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground

                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                            ),
                            child: (const Text('Register as Tutor')),
                          )),
                    ]
                    //mainAxisAlignment: MainAxisAlignment.start,

                    ),
              ],
            )));
  }
}
