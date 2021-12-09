import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tuitionmedia/tutors_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TutorLogin extends StatefulWidget {
  const TutorLogin({Key? key}) : super(key: key);

  @override
  _TutorLoginState createState() => _TutorLoginState();
}

class _TutorLoginState extends State<TutorLogin> {
  final _formKey2 = GlobalKey<FormState>();

  //editing controller
  final TextEditingController sustmailControllerlogin = TextEditingController();
  final TextEditingController passwordControllertutor = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: const Center(
          child: Text(
            'Login as Tutor',
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
        child: Form(
          key: _formKey2,
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
                         TextFormField(
                           autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: sustmailControllerlogin,
                          validator: (value) {
                            if (value!.isEmpty) {
                              "please enter your emamil";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return (" please Enter a valid Email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            sustmailControllerlogin.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            // fillColor: Colors.grey,
                            //filled:true,
                            hintText: 'Email: name@student.sust.edu',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordControllertutor,
                           validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter valid Password(Min. 6 Character)");
                            }
                          },
                          onSaved: (value) {
                            passwordControllertutor.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                          
                            prefixIcon: Icon(Icons.vpn_key),
                            // fillColor: Colors.grey,
                            //filled:true,
                            hintText: 'password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                SharedPreferences pref= await SharedPreferences.getInstance();
                                Fluttertoast.showToast(

                                    msg: "Wait for a While",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green[400],
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                    pref.setString("email", sustmailControllerlogin.text);
                                signIn2(sustmailControllerlogin.text,
                                    passwordControllertutor.text);
                                
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.black12, //background
                                onPrimary: Colors.white, //foreground
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                              ),
                              child: (const Text('Log In as Tutor')),
                            )
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signIn2(String email, String password) async {
    try {
      if (_formKey2.currentState() != null &&
          _formKey2.currentState()!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid2) => {
                  Fluttertoast.showToast(msg: "Login Successful"),

                  ///have to include the tutor's profile scene
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorsProfile()),
                  )
                })
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong !! try again",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
