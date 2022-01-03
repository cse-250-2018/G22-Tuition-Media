import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tuitionmedia/initial_scene.dart';
import 'package:tuitionmedia/parent_login.dart';

// ignore: prefer_const_constructors
Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      //Removed pre written word debug from the screen
      debugShowCheckedModeBanner: false,

      //added splashScreen
      home :const SplashScreen(),

      //moved to Initial Scene
      routes:{
        'initialscene': (context)=> const InitialScene()
      }
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

//Added timer (for how long it will be on the screen)
  void startTimer(){
    Timer(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacementNamed('initialscene');
    });
  }
  @override
  void initState() {
    
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //added background color
     backgroundColor: Colors.grey,
     body: Container(
       //added Image from assets
       decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/launch_screen.png'),
              fit:BoxFit.cover,
           )
       ),
       )
    );
  }
}
