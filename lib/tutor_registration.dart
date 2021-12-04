import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/model/tutor_model.dart';
import 'package:tuitionmedia/tutor_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TutorRegistration extends StatefulWidget {
  const TutorRegistration({Key? key}) : super(key: key);

  @override
  _TutorRegistrationState createState() => _TutorRegistrationState();
}

class _TutorRegistrationState extends State<TutorRegistration> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

//editing controller
  final tutorNameController = TextEditingController();
  final sustMailController = TextEditingController();
  final deptController = TextEditingController();
  final registrationNoController = TextEditingController();
  final tutorPasswordController = TextEditingController();
  final tutorConfirmpasswordController = TextEditingController();

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
                          controller: tutorNameController,
                          keyboardType: TextInputType.name,
                          //name should be at least 3 character
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{3,}$');
                            if (value!.isEmpty) {
                              return ("Name is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter valid Name(Min. 3 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            tutorNameController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            hintText: 'Tutor\'s Name ',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: sustMailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              "please enter your emamil";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return (" please Enter a valid SUST Mail");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            sustMailController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'SUST Student Mail',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: deptController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            deptController.text = value!;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Tutor\'s Department',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: registrationNoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            registrationNoController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
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
                        TextFormField(
                          obscureText: true,
                          controller: tutorPasswordController,
                          keyboardType: TextInputType.name,
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
                            tutorPasswordController.text = value!;
                          },
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
                        TextFormField(
                          obscureText: true,
                          controller: tutorConfirmpasswordController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (tutorConfirmpasswordController.text !=
                                tutorPasswordController.text) {
                              return "password don't match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            tutorConfirmpasswordController.text = value!;
                          },
                          decoration: const InputDecoration(
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
                                try {
                                  Fluttertoast.showToast(
                                    msg: "Wait for a While",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                  signUp2(sustMailController.text,
                                      tutorPasswordController.text);
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg: "Some credential maybe misformated",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.black12, //background
                                onPrimary: Colors.white, //foreground

                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
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
      ),
    );
  }

  void signUp2(String email, String password) async {
    if (_formkey.currentState()!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsFirestoreForTutor()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsFirestoreForTutor() async {
    //calling firestore
    //calling user model
    //calling these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    TutorModel tutorModel = TutorModel();

    //writing all the values
    tutorModel.sustMail = user!.email;
    tutorModel.uid2 = user.uid;
    tutorModel.tutorName = tutorNameController.text;
    tutorModel.dept = deptController.text;
    tutorModel.registrationNumber = registrationNoController.text;

    await firebaseFirestore
        .collection("tutors")
        .doc(user.uid)
        .set(tutorModel.toMap());

    Fluttertoast.showToast(msg: "account created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const TutorLogin()),
        (route) => false);
  }
}
