import 'package:tuitionmedia/DropdownItems/medium_list.dart';

class StudentModel {
  String? uid3;
  String? medium;
  String? studentName;
  String? group;
  String? subjects;
  String? studentGender;
  String? parentsDemand;
  String? location;
  String? tutoringDays;
  String? salary;
  String? addMobileNo;
  String? studentClass;

  StudentModel(
      {this.uid3,
      this.studentName,
      this.studentGender,
      this.medium,
      this.group,
      this.studentClass,
      this.subjects,
      this.location,
      this.parentsDemand,
      this.tutoringDays,
      this.salary,
      this.addMobileNo});

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid3': uid3,
      'studentName': studentName,
      'studentGender': studentGender,
      'medium': medium,
      'group': group,
      'studentClass': studentClass,
      'subjects': subjects,
      'location': location,
      'parentsDemand': parentsDemand,
      'tutoringDays': tutoringDays,
      'salary': salary,
      'addMobileNo': addMobileNo
    };
  }
}
