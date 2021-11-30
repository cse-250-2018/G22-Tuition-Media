import 'package:flutter/material.dart';
import 'package:tuitionmedia/parent_login.dart';

class ParentRegistration extends StatefulWidget {
  const ParentRegistration({ Key? key }) : super(key: key);

  @override
  _ParentRegistrationState createState() => _ParentRegistrationState();
}

class _ParentRegistrationState extends State<ParentRegistration> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
       appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Center(
          child: Text(
            'Register as Parent',
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
                          
                          hintText: 'Parent Name ',
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
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Gmail',
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
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText:'Referred SUST Mail',
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
                        decoration: InputDecoration(
                          
                          hintText: 'Mobile Number',
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ParentLogin()),
                               );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.black12, //background
                              onPrimary: Colors.white, //foreground
                              
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                            
                            ),
                            child: (const Text('Register as Parent')),
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