import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/parent_login.dart';
import 'package:tuitionmedia/parent_registration.dart';
import 'package:tuitionmedia/tutor_login.dart';
import 'package:tuitionmedia/tutor_registration.dart';

import 'sustmailrefer_scene.dart';

class InitialScene extends StatefulWidget {
  const InitialScene({Key? key}) : super(key: key);

  @override
  _InitialSceneState createState() => _InitialSceneState();
}

class _InitialSceneState extends State<InitialScene> {
  Widget login(text, func) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ParentLogin()),
            );
          },
          child: Text(
            "Log in as $text",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[900],
          title: const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'Tuition Media',
              style: TextStyle(
                fontSize: 25,
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          toolbarHeight: 100,
        ),
        body: Center(
          child: Container(
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage("assets/leaf.jpg"),
              //   fit: BoxFit.cover,
              // )),
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown[100],
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ParentLogin()),
                            );
                          },
                          child: const Text(
                            "Log in as Parent",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown[200],
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TutorLogin()),
                            );
                          },
                          child: const Text(
                            "Log in as Tutor",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown[300],
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SustMailReferenceScene()),
                            );
                          },
                          child: const Text(
                            "Register as parent",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown[400],
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TutorRegistration()),
                            );
                          },
                          child: const Text(
                            "Register as tutor",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       SizedBox(
                    //           height: 200,
                    //           width: 190,
                    //           child: ElevatedButton(
                    //             onPressed: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         const ParentRegistration()),
                    //               );
                    //             },
                    //             style: ElevatedButton.styleFrom(
                    //               textStyle: const TextStyle(fontSize: 20),
                    //               primary: Colors.black12, //background
                    //               onPrimary: Colors.white, //foreground

                    //               padding:
                    //                   const EdgeInsets.symmetric(horizontal: 30),
                    //             ),
                    //             child: (const Text('Register as Parent')),
                    //           )),
                    //       SizedBox(
                    //           height: 200,
                    //           width: 190,
                    //           child: ElevatedButton(
                    //             onPressed: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         const TutorRegistration()),
                    //               );
                    //             },
                    //             style: ElevatedButton.styleFrom(
                    //               textStyle: const TextStyle(fontSize: 20),
                    //               primary: Colors.black12, //background
                    //               onPrimary: Colors.white, //foreground

                    //               padding:
                    //                   const EdgeInsets.symmetric(horizontal: 30),
                    //             ),
                    //             child: (const Text('Register as Tutor')),
                    //           )),
                    //     ]
                    //     //mainAxisAlignment: MainAxisAlignment.start,

                    //     ),
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //   SizedBox(
          //       height: 200,
          //       width: 190,
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const ParentLogin()),
          //           );
          //         },
          //         style: ElevatedButton.styleFrom(
          //           //alignment: Alignment.center,
          //           textStyle: const TextStyle(fontSize: 20),
          //           primary: Colors.black12, //background
          //           onPrimary: Colors.white, //foreground

          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 30),
          //         ),
          //         child: (const Text('Log In as Parent')),
          //       )),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.redAccent,
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParentLogin()),
                  );
                },
                child: const Text(
                  "Log in as Parent",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 20,
          ),

          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.redAccent,
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TutorLogin()),
                  );
                },
                child: const Text(
                  "Log in as Tutor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ]
        //mainAxisAlignment: MainAxisAlignment.start,

        );
  }
}
