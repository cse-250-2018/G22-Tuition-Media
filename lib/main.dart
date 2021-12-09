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
      debugShowCheckedModeBanner: false,
      home :const SplashScreen(),
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
     backgroundColor: Colors.grey,
     body: Container(
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