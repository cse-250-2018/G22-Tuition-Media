// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:tuitionmedia/DropdownItems/dept_list.dart';
import 'package:tuitionmedia/DropdownItems/groups_list.dart';
import 'package:tuitionmedia/DropdownItems/subject_list.dart';
import 'package:tuitionmedia/model/tutor_model.dart';
import 'package:tuitionmedia/verifytutor.dart';
import 'DropdownItems/dept_list.dart';
import 'DropdownItems/gender_list.dart';

class TutorRegistration extends StatefulWidget {
  const TutorRegistration({Key? key}) : super(key: key);

  @override
  _TutorRegistrationState createState() => _TutorRegistrationState();
}

class _TutorRegistrationState extends State<TutorRegistration> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String _selectedDept = deptList[0];
  String _selectedGender = genderList[0];
  String _selectedGroupbytutor = group[0];
  List<String> _selectedSubjects = [];
  String subjects = '';

//editing controller
  final tutorNameController = TextEditingController();
  final sustMailController = TextEditingController();
  final deptController = TextEditingController();
  final registrationNoController = TextEditingController();
  final tutorPasswordController = TextEditingController();
  final tutorConfirmpasswordController = TextEditingController();
  final genderController = TextEditingController();
  final tutorsMobilenoController = TextEditingController();
  //new
  final experienceController = TextEditingController();
  final tutorsAddressController = TextEditingController();

  final genders = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: const Text(
          'Register as Tutor',
          style: TextStyle(
            fontSize: 25,
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
                                  BorderRadius.all(Radius.circular(10.0)),
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
                              "Please enter your email";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return (" Please enter a valid SUST Mail");
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
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //

                        DropdownButtonFormField(
                          // value: _selectedDept,
                          onChanged: (value) {
                            setState(() {
                              _selectedDept = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              // icon: Icon(Icons.home),
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Department'),
                          items: deptList.map(buildMenuItem).toList(),
                          isExpanded: true,
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
                            prefixIcon: Icon(Icons.keyboard),
                            hintText: 'Registration Number',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //new
                        TextFormField(
                          controller: experienceController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            experienceController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mode_edit_outlined),
                            hintText: 'Experience',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              _selectedGroupbytutor = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.alt_route),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Group of Tutor'),
                          items: group.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
//end new
                        TextFormField(
                          controller: tutorsMobilenoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            registrationNoController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.call_rounded),
                            hintText: 'Mobile number',
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
                          controller: tutorsAddressController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            tutorsAddressController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_city_outlined),
                            hintText: 'Tutors Current Address',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        DropdownButtonFormField(
                          // value: _selectedDept,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              // icon: Icon(Icons.home),
                              prefixIcon: Icon(Icons.perm_identity),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Gender'),
                          items: genderList.map(buildMenuItem).toList(),
                          isExpanded: true,
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
                          obscureText: true,
                          controller: tutorConfirmpasswordController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (tutorConfirmpasswordController.text !=
                                tutorPasswordController.text) {
                              return "Password doesn't match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            tutorConfirmpasswordController.text = value!;
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
                                  Fluttertoast.showToast(
                                      msg: "Please wait for a while",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0);
                                  signUp2(sustMailController.text,
                                      tutorPasswordController.text);
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg: "Some credentials maybe misformated",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                primary: Colors.brown[700], //background
                                onPrimary: Colors.white, //foreground

                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                              ),
                              child: (const Text('Register as Tutor')),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
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
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsFirestoreForTutor()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      child: Text(item),
      value: item,
    );
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
    tutorModel.dept = _selectedDept;
    tutorModel.registrationNumber = registrationNoController.text;
    tutorModel.gender = _selectedGender;
    tutorModel.mobileno = tutorsMobilenoController.text;
    tutorModel.groupofTutor = _selectedGroupbytutor;
    tutorModel.experience = experienceController.text;
    tutorModel.tutorsAddress = tutorsAddressController.text;

    await firebaseFirestore
        .collection("tutors")
        .doc(user.uid)
        .set(tutorModel.toMap());

    //Fluttertoast.showToast(msg: "account created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const SustMailVerify()),
        (route) => false);
  }
//   void _showMultiSelectDialog(BuildContext context) async {
//   await showDialog(
//     context: context,
//     builder: (ctx) {
//       return  MultiSelectDialog(
//         items: subjectsList.map((e) => MultiSelectItem(e, e)).toList(),
//         initialValue: _selectedAnimals,
//         onConfirm: (values) {...},
//       );
//     },
//   );
// }
}
