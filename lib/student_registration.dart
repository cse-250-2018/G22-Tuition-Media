import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/model/student_model.dart';
import 'package:tuitionmedia/allstudentsprofile.dart';
import 'DropdownItems/gender_list.dart';
import 'DropdownItems/groups_list.dart';
import 'DropdownItems/medium_list.dart';
import 'DropdownItems/class_list.dart';
import 'DropdownItems/days_list.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

//this class is used for registering new student under a parents account 
class _StudentRegistrationState extends State<StudentRegistration> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String _selectedMedium = medium[0];
  String _selectedGroup = group[0];
  String _selectedGenderofStudent = genderList[0];
  String _selectedClass = classList[0];
  String _selectedDays= daysList[0];


//editing controller
  final studentNameController = TextEditingController();
  final subjectController = TextEditingController();
  final salaryController = TextEditingController();
  final locationController = TextEditingController();
  final parentsDemandController = TextEditingController();
  final studentmobileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: const Center(
          child: Text(
            'Add new Student',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 130,
      ),
      //added SingleChildScrollView so that we can scroll
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

                        //taken student name via this formfield

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
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        
                        //taken dept value via DropdownButtonField

                        DropdownButtonFormField(
                          // value: _selectedDept,
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
                        
                        //used DropdownButtonFormField for taking input of medium
                        DropdownButtonFormField(
                          
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
                        
                        //used DropdownButtonformfield for taking input of Groups
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

                        //used DropdownButtonFormField for taking input of which class student is studying
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

                        // used this to know which subjects should be taught
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
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //students location ,where tutor should go
                        TextFormField(
                          controller: locationController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            locationController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_on_rounded),
                            hintText: 'Location of students house',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //parents demand: that means what parents want from tutor,they can add conditon here
                        //it's upto partents,whatever their requirement is  they can add here
                        TextFormField(
                          controller: parentsDemandController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            parentsDemandController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.handyman),
                            hintText: 'Parents demand to Tutor ',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //add this dropdownButton so that TUTORING days can be fixed here
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
                          hint: const Text('Tutoring day\'s in a week'),
                          items: daysList.map(buildMenuItem).toList(),
                          isExpanded: true,
                        ),
                       /* TextFormField(
                          controller: tutoringDaysController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            tutoringDaysController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.calendar_view_week),
                            hintText: 'Tutoring day\'s in a week',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),*/
                        const SizedBox(
                          height: 30,
                        ),

                        //salary that parents are willing to give to tutor
                        TextFormField(
                          controller: salaryController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            salaryController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.money_rounded),
                            hintText: 'Salary (in Tk)',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //added mobile no
                        TextFormField(
                          controller: studentmobileNoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {},
                          onSaved: (value) {
                            studentmobileNoController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.add_ic_call_sharp),
                            hintText: 'Add mobile no',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //submitting all values
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
                                  //signUp3(studentNameController.text,_selectedGenderofStudent);
                                  postDetailsFirestoreForStudent();
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

//required function for dropdownmenu item
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      child: Text(item),
      value: item,
    );
  }

  //sending data to firebase for students
  postDetailsFirestoreForStudent() async {
    //calling firestore
    //calling user model
    //calling these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    StudentModel studentModel = StudentModel();

    //writing all the values

    studentModel.uid3 = user!.uid;
    studentModel.studentName=studentNameController.text;
    studentModel.studentGender=_selectedGenderofStudent;
    studentModel.medium =_selectedMedium;
    studentModel.group= _selectedGroup;
    studentModel.studentClass=_selectedClass;
    studentModel.subjects = subjectController.text;
    studentModel.location=locationController.text;
    studentModel.parentsDemand=locationController.text;
    studentModel.tutoringDays=_selectedDays;
    studentModel.salary=salaryController.text;
    studentModel.addMobileNo= studentmobileNoController.text;

    try{
      await firebaseFirestore
        .collection("students")
        .doc(user.uid)
        .set(studentModel.toMap());

        Fluttertoast.showToast(msg: "account created successfully");

        Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const AllStudentsProfile()),
        (route) => false);
        
    }
    catch(e){
      Fluttertoast.showToast(msg: "Error Occurred");
    }
    
    //Fluttertoast.showToast(msg: "account created successfully");
  }
}
