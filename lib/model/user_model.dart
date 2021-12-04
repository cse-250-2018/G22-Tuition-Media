class UserModel{
  String? uid;
  String? email;
  String? parentName;
  String? refferedSustMail;
  String? mobileno;

  UserModel({this.uid,this.email,this.parentName,this.refferedSustMail,this.mobileno});

  //receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      parentName: map['parentname'],
      mobileno: map['mobileno'],
      refferedSustMail: map['refferedSustMail'],

    );
  }

  //sending data to our server
  Map<String, dynamic> toMap()
  {
    return{
      'uid':uid,
      'email':email,
      'parentName':parentName,
      'mobileno':mobileno,
      'referredSustMail':refferedSustMail,

    };
  }

}