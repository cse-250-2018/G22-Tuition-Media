import 'package:flutter/material.dart';
import 'package:tuitionmedia/tutors_profile.dart';

class TutorLogin extends StatefulWidget {
  const TutorLogin({ Key? key }) : super(key: key);

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
      body:SingleChildScrollView(
        child: 
           Stack(
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
                          prefixIcon: Icon(Icons.mail),
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
                        height: 50,
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          //new
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TutorsProfile()),
                               );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground
                              
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                            
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
      
    ),);
  }
}