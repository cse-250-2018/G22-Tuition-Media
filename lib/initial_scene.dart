import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/help.dart';
import 'package:tuitionmedia/parent_login.dart';
import 'package:tuitionmedia/parent_registration.dart';
import 'package:tuitionmedia/sustmailrefer_scene.dart';
import 'package:tuitionmedia/tutor_login.dart';
import 'package:tuitionmedia/tutor_registration.dart';

class InitialScene extends StatefulWidget {
  const InitialScene({Key? key}) : super(key: key);

  @override
  _InitialSceneState createState() => _InitialSceneState();
}

//here we added 4 different route and help scene(where people can go to understand the app's feature)
class _InitialSceneState extends State<InitialScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('assets/leaf.jpg'),
          fit: BoxFit.cover,
        ),
        
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
        toolbarHeight: 190,
      ),
        body: Container(
          //added background image and fitted it to boxsize
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/leaf.jpg"),
              fit: BoxFit.cover,
            )),

            //added parent login,parents registration, tutor login,tutor registration,help Rows in this column .
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery. of(context). size. height/6,
                          width: MediaQuery. of(context). size. width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                //directed to parentlogin scene
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
                    ]
                ),
                Row(
                  
                    children: <Widget>[
                      SizedBox(
                           height: MediaQuery. of(context). size. height/6,
                          width: MediaQuery. of(context). size. width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                //directed to tutorlogin scene
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
                           height: MediaQuery. of(context). size. height/6,
                          width: MediaQuery. of(context). size. width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //directed to parent Registration scene
                                    builder: (context) =>
                                        const SustMailReferenceScene()),
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
                          )),]
                    ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      SizedBox(
                           height: MediaQuery. of(context). size. height/6,
                          width: MediaQuery. of(context). size. width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //directed to tutorRegistration scene
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
                    

                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      
                      //SizedBox(
                         //  height: MediaQuery. of(context). size. height/9,
                          //width: MediaQuery. of(context). size. width/1.5,
                          
                           ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //directed to help scene
                                    builder: (context) =>

                                        const NeedHelp()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.brown, //background
                              onPrimary: Colors.white, //foreground

                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                            ),
                            child: (const Text('Need Help??')),
                          ),
                    ]
                    //mainAxisAlignment: MainAxisAlignment.start,

                    ),
              ],
            )));
  }
}
