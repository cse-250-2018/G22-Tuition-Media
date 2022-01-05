import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuitionmedia/homepage.dart';
import 'package:tuitionmedia/pages/parent_page.dart';

class ParentLogin extends StatefulWidget {
  const ParentLogin({Key? key}) : super(key: key);

  @override
  _ParentLoginState createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  set emailField(TextFormField emailField) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: const Text(
          'Login as Parent',
          style: TextStyle(
            fontSize: 25,
            // fontStyle: FontStyle.italic,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 90,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            //newly added

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
                          // autofocus: false,
                          controller: emailController,
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
                            emailController.text = value!;
                            //debugPrint(emailController.text);
                          },
                          textInputAction: TextInputAction.next,
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
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter a valid password (Min. 6 Character)");
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
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
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: "Wait for a While",
                                    toastLength: Toast.LENGTH_LONG,
                                    // gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    //  backgroundColor: Colors.blueGrey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                signIn(emailController.text,
                                    passwordController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 17),
                                primary: Colors.brown[700], //background
                                onPrimary: Colors.white, //foreground

                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                              ),
                              child: (const Text('Log In as Parent')),
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

  void signIn(String email, String password) async {
    try {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ParentPage()),
                  )
                })
            .catchError((e) {
          Fluttertoast.showToast(
              msg:
                  "Log in failed. The email or password that you entered is incorrect. ");
        });
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //     msg: " ",
      //     toastLength: Toast.LENGTH_LONG,
      //   //  gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }
}
