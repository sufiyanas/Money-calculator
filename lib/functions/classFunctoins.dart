import 'dart:developer';

import 'package:englis_only/dB/db.dart';
import 'package:englis_only/functions/HiveFunctions.dart';
import 'package:flutter/cupertino.dart';

class AddStudentFunction {
  static addStudent({required String UserName, required BuildContext context}) {
    log('Add Student called');
    log(UserName);
    final StudentBox = getStudentBox();
    StudentModel newStudent = StudentModel(
      name: UserName,
      count: 0,
    );
    StudentBox.put(UserName, newStudent);
    Navigator.pop(context);
  }

  static deleteStudent({required String UserName}) {
    final StudentBox = getStudentBox();
    StudentBox.delete(UserName);
  }
}

class StudentCounnting {
  static Increment({required int count, required String UserName}) {
    log('Increment called');
    final StudentBox = getStudentBox();
    final NewCount = count + 10;
    StudentModel IncrementedStudent =
        StudentModel(name: UserName, count: count);
    StudentBox.put(UserName, IncrementedStudent);
  }
}
