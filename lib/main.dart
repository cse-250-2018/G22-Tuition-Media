import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tuitionmedia/initial_scene.dart';
import 'package:tuitionmedia/pages/start_page.dart';
import 'package:tuitionmedia/parent_login.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: prefer_const_constructors
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  static const String _title = 'SUST Tutors';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: _title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Inter',
          buttonTheme: ButtonThemeData(
            buttonColor: const Color(0xFFFEDBD0),
            splashColor: Colors.brown[600],
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown[900],
          ),
          textTheme: const TextTheme(
            headline6: TextStyle(
              fontFamily: 'Inter',
            ),
          ),
        ),
        home: Scaffold(
          body: StartPage(),
          backgroundColor: Colors.white,
        ),
        routes: {'startpage': (context) => const StartPage()});
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

<<<<<<< HEAD
  @override
  _SplashScreenState createState() => _SplashScreenState();
=======


   @override
   _SplashScreenState createState() => _SplashScreenState();
>>>>>>> ccd90feb1b4c282ffb65d8f2f96c5ccd4cbad6d8
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    Timer(const Duration(seconds: 2), () {
<<<<<<< HEAD
      Navigator.of(context).pushReplacementNamed('startPage');
=======
      Navigator.of(context).pushReplacementNamed('initialscene');

>>>>>>> ccd90feb1b4c282ffb65d8f2f96c5ccd4cbad6d8
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 200,
            child: Image.asset(
              "assets/logo.jpg",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );

  }
}
