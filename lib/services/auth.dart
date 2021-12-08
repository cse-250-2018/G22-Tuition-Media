import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuitionmedia/model/tutor_model.dart';
import 'package:tuitionmedia/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  Tutor? _userFromFireBaseUser(User user) {
    return user != null ? Tutor(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Tutor?> get tutors {
    return _auth
        .authStateChanges()
        .map((event) => _userFromFireBaseUser(event!));
  }

  //anonymus sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //email-pass sign in

  //register with email-pass
  Future registerWithEmailPass(String email, String password, String name,
      String reg, String dept) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(email, name, reg, dept);

      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signinWithEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;


//     Future signUp2(String email, String password) async {
    
//       await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) => {
            
//             //postDetailsFirestoreForTutor()
//             })
//           .catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
  
// }
