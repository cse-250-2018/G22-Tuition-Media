import 'package:flutter/material.dart';
import 'package:tuitionmedia/tutor_login.dart';

class TutorRegistration extends StatefulWidget {
  const TutorRegistration({ Key? key }) : super(key: key);

  @override
  _TutorRegistrationState createState() => _TutorRegistrationState();
}

class _TutorRegistrationState extends State<TutorRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
       appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Center(
          child: Text(
            'Register as Tutor',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 150,
      ),
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          
                          hintText: 'Name ',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          
                          hintText: 'SUST Mail',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          
                          hintText: 'Department',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          
                          hintText: 'Registration Number',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          
                          hintText: 'password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const TutorLogin()),
                               );
                            },
                            style: const ButtonStyle(),
                            child: (const Text('Register as Tutor')),
                          )
                        ],
                      ),
                      
                      
                    ],
                  )),
            )
          ],
        ),
        ),
    );
  }
}