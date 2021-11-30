import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuitionmedia/homepage.dart';
import 'package:tuitionmedia/parent_registration.dart';
import 'package:tuitionmedia/tutor_login.dart';
import 'package:tuitionmedia/tutor_registration.dart';

class ParentLogin extends StatefulWidget {
  const ParentLogin({Key? key}) : super(key: key);

  @override
  _ParentLoginState createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  set emailField(TextFormField emailField) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Center(
          child: Text(
            'Welcome to Tuition Media',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 150,
      ),
      body: SingleChildScrollView(
        child: Stack(
          //newly added
          key: _formKey,
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      emailField = TextFormField(
                        autofocus: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          emailController.text = value!;
                          debugPrint(emailController.text);
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Email',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homepage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground
                              
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                            
                            ),
                            child: (const Text('Log In as Parent')),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TutorLogin()),
                              );
                            },
                            child: const Text(
                              'Log In as Tutor',
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ParentRegistration()),
                              );
                            },
                            child: const Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Register as Parent',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TutorRegistration()),
                              );
                            },
                            child: const Text(
                              'Register as Tutor',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
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
