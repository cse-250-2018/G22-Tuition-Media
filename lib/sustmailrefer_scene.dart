// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/alltutorsprofile.dart';
import 'package:tuitionmedia/model/demo_model.dart';
import 'package:tuitionmedia/model/user_model.dart';
import 'package:tuitionmedia/parent_login.dart';
import 'package:tuitionmedia/referdmail_verification.dart';
import 'package:tuitionmedia/verify.dart';

//Here we registered parents

class SustMailReferenceScene extends StatefulWidget {
  const SustMailReferenceScene({Key? key}) : super(key: key);

  @override
  _SustMailReferenceSceneState createState() => _SustMailReferenceSceneState();
}

class _SustMailReferenceSceneState extends State<SustMailReferenceScene> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

//editing controllers
  
  final refferedsustmailController1 = TextEditingController();
  String passwordControl="garbagepas";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
         backgroundColor: Colors.teal,
        toolbarHeight: 100,
      ),
      
      //added within a singleChildScrollView so that we can scroll 
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  //added padding to this container
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2,
                        right: 35,
                        left: 35),
                    child: Column(
                      //added TextFormField for refered sust mail 
                      children: [
                        
                      
                        TextFormField(
                          autofocus: false,
                          controller: refferedsustmailController1,
                          keyboardType: TextInputType.emailAddress,

                          //added validator to validate this sust mail
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Enter reffered SUST mail";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return (" please Enter a valid SUST Email");
                            }
                            return null;
                          },

                          onSaved: (value) {
                            refferedsustmailController1.text = value!;
                            //debugPrint(emailController.text);
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Referred SUST Mail',
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
                              onPressed: () {
                                Fluttertoast.showToast(
                                      msg: "A email has been sent to that SUST mail ask him/her to verify",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                try {
                                  signUp(refferedsustmailController1.text,
                                      passwordControl);
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
                              child: (const Text('Send mail')),
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

  //did signup using email,password and all other constrain 
  void signUp(String email, String password) async {
    try{
 if (_formkey.currentState()!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
    }
    catch(e)
    {
      Fluttertoast.showToast(
          msg: "you have gave wrong information",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
   
  }

  //saving data to firebase firestore 
  postDetailsFirestore() async {
    //calling firestore
    //calling user model
    //calling these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    DemoModel demoModel = DemoModel();

    //writing all the values
    demoModel.referedsustmail1 = user!.email;
    demoModel.uid0 = user.uid;
    

    await firebaseFirestore
        .collection("demo")
        .doc(user.uid)
        .set(demoModel.toMap());

    //Fluttertoast.showToast(msg: "account created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const RefferedMailVerification()),
        (route) => false);
        //er pore notun page e msg diba,then account delete krba
  }
}
