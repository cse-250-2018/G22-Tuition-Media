import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      //JA JA DESIGN KORA DRKR KORBI
      //EITA HOLO PARENT ER HOMEPAGE,EINEI SUBJECT WISE FOLDER(BA JA RAKHLE VALO HOY R KI) KORBI,PORE TA THEKE tUTOR ER PROFILE E JABE
    );
  }
}
