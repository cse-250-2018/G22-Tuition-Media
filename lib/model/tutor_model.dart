class TutorModel{
  String? uid2;
  String? sustMail;
  String? tutorName;
  String? registrationNumber;
  String? dept;
  String ? gender;
  String? mobileno;
  String? tutorCollegeName;

  TutorModel({this.uid2,this.sustMail,this.tutorName,this.registrationNumber,this.dept,this.gender,this.mobileno,this.tutorCollegeName});

  //receiving data from server
  factory TutorModel.fromMap(map){
    return TutorModel(
      uid2: map['uid2'],
      sustMail: map['sustMail'],
      tutorName: map['tutorName'],
      dept: map['dept'],
      registrationNumber: map['registrationNumber'],
      gender: map['gender'],
      mobileno: map['mobileno'],
      tutorCollegeName: map['tutorCollegeName']

    );
  }

  //sending data to our server
  Map<String, dynamic> toMap()
  {
    return{
      'uid2':uid2,
      'sustMail':sustMail,
      'tutorName':tutorName,
      'dept':dept,
      'registrationNumber':registrationNumber,
      'gender': gender,
      'mobileno' :mobileno,
      'tutorCollegeName':tutorCollegeName,

    };
  }

}