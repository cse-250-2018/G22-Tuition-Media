import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuitionmedia/model/tutor_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference tutorCollection =
      FirebaseFirestore.instance.collection('tutors');

  Future updateUserData(String sustMail, String tutorName,
      String registrationNumber, String dept) async {
    return await tutorCollection.doc(uid).set({
      'sustMail': sustMail,
      'tutorName': tutorName,
      'registrationNumber': registrationNumber,
      'dept': dept
    });
  }

  //userData from snapshot
  TutorModel _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return TutorModel(
        uid: uid,
        sustMail: snapshot['sustMail'],
        tutorName: snapshot['tutorName'],
        registrationNumber: snapshot['registrationNumber'],
        dept: snapshot['dept']);
  }

  //brewlist from snapshot
  List<TutorModel> _tutorListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((e) => TutorModel(
            sustMail: e['sustMail'] ?? '',
            tutorName: e['tutorName'] ?? '',
            registrationNumber: e['registrationNumber'] ?? '0',
            dept: e['dept']))
        .toList();
  }

  //get brews stream
  Stream<List<TutorModel>> get tutors {
    return tutorCollection.snapshots().map(_tutorListFromSnapshot);
  }

  Stream<TutorModel> get userData {
    return tutorCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
