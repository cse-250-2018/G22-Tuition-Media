class UserModel {
  String? uid;
  String? email;
  String? parentName;
  String? refferedSustMail;
  String? mobileno;
  int count;
  List<String>? students;

  UserModel(
      {this.uid,
      this.email,
      this.parentName,
      this.refferedSustMail,
      this.students,
      this.count = 0,
      this.mobileno});

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        parentName: map['parentName'],
        mobileno: map['mobileno'],
        refferedSustMail: map['refferedSustMail'],
        students: map['students'],
        count: map['count'] as int);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'parentName': parentName,
      'mobileno': mobileno,
      'referredSustMail': refferedSustMail,
      'count': count,
      'students': students
    };
  }
}
