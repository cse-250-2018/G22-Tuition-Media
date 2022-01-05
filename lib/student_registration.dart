import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/model/user_model.dart';
import 'package:tuitionmedia/pages/browse_tutor_for_parent.dart';

import 'DropdownItems/days_per_week.dart';
import 'DropdownItems/gender_list.dart';
import 'DropdownItems/groups_list.dart';
import 'DropdownItems/medium_list.dart';
import 'DropdownItems/class_list.dart';
import 'model/student_model.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String _selectedMedium = medium[0];
  String _selectedGroup = group[0];
  String _selectedGenderofStudent = genderList[0];
  String _selectedClass = classList[0];
  String _selectedDays = daysList[0];
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

//editing controller
  final studentNameController = TextEditingController();
  final subjectController = TextEditingController();
  final salaryController = TextEditingController();
  final locationController = TextEditingController();
  final parentsDemandController = TextEditingController();
  final studentmobileNoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      print(loggedInUser);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add new Student',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 80,
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
                          controller: studentNameController,
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
                            studentNameController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            hintText: 'Student\'s Name ',
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
                              _selectedGenderofStudent = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              // icon: Icon(Icons.home),
                              prefixIcon: Icon(Icons.perm_identity),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Student\'s Gender'),
                          items: genderList.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          // value: _selectedDept,
                          onChanged: (value) {
                            setState(() {
                              _selectedMedium = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              // icon: Icon(Icons.home),
                              prefixIcon: Icon(Icons.book),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Medium'),
                          items: medium.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              _selectedGroup = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.alt_route),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Group'),
                          items: group.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              _selectedClass = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.alt_route),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Class'),
                          items: classList.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: subjectController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            subjectController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.book_online_outlined),
                            hintText: 'Subjects to be taught',
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
                          controller: locationController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            locationController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_on_rounded),
                            hintText: 'Location',
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
                              _selectedDays = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              // icon: Icon(Icons.home),
                              prefixIcon: Icon(Icons.perm_identity),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                          hint: const Text('Tutoring days per week'),
                          items: daysList.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: salaryController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            salaryController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.money_rounded),
                            hintText: 'Salary offered',
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
                          controller: studentmobileNoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            studentmobileNoController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.add_ic_call_sharp),
                            hintText: 'Mobile',
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
                          controller: parentsDemandController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            parentsDemandController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.handyman),
                            hintText: 'Other requirements',
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
                                      msg: "Wait for a While",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0);
                                  //signUp3(studentNameController.text,_selectedGenderofStudent);
                                  postDetailsFirestoreForTutor();
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg: "Some credential maybe misformated",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0);
                                  Navigator.pop(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 17),
                                primary: Colors.brown[700], //background
                                onPrimary: Colors.white, //foreground

                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                              ),
                              child: (const Text('Add new student')),
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

  // used student name and gender instead of email and password
/*void signUp3(String studentname,String gender) async {
    if (_formkey.currentState()!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: studentname, password: gender)
          .then((value) => {postDetailsFirestoreForTutor()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }*/
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

    StudentModel studentModel = StudentModel();

    //writing all the values

    studentModel.uid3 = user!.uid;
    studentModel.studentName = studentNameController.text;
    studentModel.studentGender = _selectedGenderofStudent;
    studentModel.medium = _selectedMedium;
    studentModel.group = _selectedGroup;
    studentModel.studentClass = _selectedClass;
    studentModel.subjects = subjectController.text;
    studentModel.location = locationController.text;
    studentModel.parentsDemand = locationController.text;
    studentModel.tutoringDays = _selectedDays;
    studentModel.salary = salaryController.text;
    studentModel.addMobileNo = studentmobileNoController.text;

    try {
      String ud = '${user.uid}${loggedInUser.count + 1}';
      await firebaseFirestore
          .collection("students")
          .doc(ud)
          .set(studentModel.toMap());
      loggedInUser.count++;
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(loggedInUser.toMap());

      Fluttertoast.showToast(msg: "account created successfully");

      // Navigator.pushAndRemoveUntil(
      // (context),
      // MaterialPageRoute(builder: (context) => const AllStudentsProfile()),
      // (route) => false);

    } catch (e) {
      Fluttertoast.showToast(msg: "Error Occurred");
    }
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const BrowseTutorForParent()),
        (route) => false);

    //Fluttertoast.showToast(msg: "account created successfully");
  }
}
