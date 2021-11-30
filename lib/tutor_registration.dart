import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuitionmedia/tutor_login.dart';

class TutorRegistration extends StatefulWidget {
  const TutorRegistration({ Key? key }) : super(key: key);

  @override
  _TutorRegistrationState createState() => _TutorRegistrationState();
}

class _TutorRegistrationState extends State<TutorRegistration> {

  final _formkey = GlobalKey<FormState>();

//editing controller
  final  nameController = TextEditingController();
  final  emailController = TextEditingController();
   final  deptController = TextEditingController();
  final  registrationController = TextEditingController();
   final  passwordController = TextEditingController();
  final  confirmpasswordController = TextEditingController();

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
        toolbarHeight: 130,
      ),
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                       TextField(
                        controller: nameController,
                        decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
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
                       TextField(
                        controller: emailController,
                        decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
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
                       TextField(
                        controller: deptController,
                        decoration: const InputDecoration(
                        
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
                       TextField(
                        controller: registrationController,
                        decoration:const InputDecoration(
                          
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
                      
                       TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
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
                       TextField(
                        obscureText: true,
                        controller: confirmpasswordController,
                        decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          hintText: 'confirm password',
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
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const TutorLogin()),
                               );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground
                              
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                            
                            ),
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