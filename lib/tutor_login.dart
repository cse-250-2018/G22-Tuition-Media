import 'package:flutter/material.dart';
import 'package:tuitionmedia/tutors_profile.dart';

class TutorLogin extends StatefulWidget {
  const TutorLogin({Key? key}) : super(key: key);

  @override
  _TutorLoginState createState() => _TutorLoginState();
}

class _TutorLoginState extends State<TutorLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
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
                      const TextField(
                        decoration: InputDecoration(
                          // fillColor: Colors.grey,
                          //filled:true,
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
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          // fillColor: Colors.grey,
                          //filled:true,
                          hintText: 'Password',
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
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TutorsProfile()),
                              );
                            },
                            style: const ButtonStyle(),
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
    );
  }
}
