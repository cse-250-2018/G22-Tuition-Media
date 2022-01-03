import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/model/tutor_model.dart';
import 'package:tuitionmedia/tutor_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/verifytutor.dart';
import 'package:tuitionmedia/DropdownItems/dept_list.dart';
import 'package:tuitionmedia/DropdownItems/gender_list.dart';

class TutorRegistration extends StatefulWidget {
  const TutorRegistration({Key? key}) : super(key: key);

  @override
  _TutorRegistrationState createState() => _TutorRegistrationState();
}

////Here we registered tutors

class _TutorRegistrationState extends State<TutorRegistration> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
   String _selectedDept = deptList[0];
  String _selectedGender = genderList[0];

 
//editing controller
  final tutorNameController = TextEditingController();
  final tutorCollegeNameController = TextEditingController();
  final sustMailController = TextEditingController();
  
  final registrationNoController = TextEditingController();
  final tutorPasswordController = TextEditingController();
  final tutorConfirmpasswordController = TextEditingController();
 
  final tutorsMobilenoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
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

      //added singleChildScrollView so that we can scroll
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

                        //in this colum we added TextFormField of tutor name,sustmail,registrtion,Ex-college,mobile no here
                        //and added dropdownbuttonForm field for current dept and gender

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

                        //used sizedBox to have distance between two Textformfield

                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: sustMailController,
                          keyboardType: TextInputType.emailAddress,
                          //added email validation
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
                        /*TextFormField(
                          controller: deptController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            deptController.text = value!;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.house_outlined),
                            hintText: 'Tutor\'s Department',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),*/
                       
                       //In dropdownbutton we can only select one value ,here one can select only 1 dept.

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
                          controller: tutorCollegeNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {},
                          onSaved: (value) {
                            tutorCollegeNameController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.keyboard),
                            hintText: 'Tutor\'s Ex-college Name',
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
                            prefixIcon: Icon(Icons.keyboard),
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
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        
                        DropdownButtonFormField(
                          
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value.toString();
                            });
                          },
                          decoration: const InputDecoration(
                              
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

                          //password should be at least 6 character

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

                        //added this row for registration button
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

//this method is used for signup for tutors

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

//need this function for dropdownformfield
    DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      child: Text(item),
      value: item,
    );
  }

  //sending data to firebase firestore and save it there
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
    tutorModel.tutorCollegeName=tutorCollegeNameController.text;

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
}
