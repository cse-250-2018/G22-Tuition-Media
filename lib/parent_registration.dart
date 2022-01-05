// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/homepage.dart';
import 'package:tuitionmedia/model/user_model.dart';
import 'package:tuitionmedia/parent_login.dart';

import 'package:tuitionmedia/verify.dart';


class ParentRegistration extends StatefulWidget {
  const ParentRegistration({Key? key}) : super(key: key);

  @override
  _ParentRegistrationState createState() => _ParentRegistrationState();
}

class _ParentRegistrationState extends State<ParentRegistration> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

//editing controller
  final parentnameController = TextEditingController();
  final emailControllerparent = TextEditingController();
  final refferedsustmailController = TextEditingController();
  final mobilenoController = TextEditingController();
  final passwordControllerparent = TextEditingController();
  final confirmpasswordControllerparent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Text(
          'Register as Parent',
          style: TextStyle(
            fontSize: 25,
            // fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 90,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                        TextFormField(
                          autofocus: false,

                          controller: parentnameController,
                          keyboardType: TextInputType.name,
                          //name should be at least 3 character
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{3,}$');
                            if (value!.isEmpty) {
                              return ("Name is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter a valid name(Min. 3 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            parentnameController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            hintText: 'Parent Name ',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: emailControllerparent,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Please enter your email";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailControllerparent.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: refferedsustmailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Enter referred SUST mail";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return ("Please enter a valid SUST mail");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            refferedsustmailController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Referred SUST Mail',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: mobilenoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            mobilenoController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.call_rounded),
                            hintText: 'Mobile Number',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordControllerparent,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter a valid Password (Min. 6 Character)");
                            }
                          },
                          onSaved: (value) {
                            passwordControllerparent.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            // fillColor: Colors.grey,
                            //filled:true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          controller: confirmpasswordControllerparent,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (confirmpasswordControllerparent.text !=
                                passwordControllerparent.text) {
                              return "Password does't match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            confirmpasswordControllerparent.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: 'Confirm password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                                try {
                                  signUp(emailControllerparent.text,
                                      passwordControllerparent.text);
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Some credentials may be misformated.",
                                      toastLength: Toast.LENGTH_LONG,
                                      // gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      // backgroundColor: Colors.red,
                                      // textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.brown[700], //background
                                onPrimary: Colors.white, //foreground

                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: (const Text('Register as Parent')),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
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

  void signUp(String email, String password) async {
    try {
      if (_formkey.currentState()!.validate()) {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  postDetailsFirestore() async {
    //calling firestore
    //calling user model
    //calling these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.parentName = parentnameController.text;
    userModel.refferedSustMail = refferedsustmailController.text;
    userModel.mobileno = mobilenoController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    //Fluttertoast.showToast(msg: "account created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const VerifyScreen()),
        (route) => false);
  }
}
