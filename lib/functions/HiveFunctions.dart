import 'package:englis_only/constants/const.dart';
import 'package:englis_only/dB/db.dart';
import 'package:hive_flutter/adapters.dart';

Box<StudentModel> getStudentBox() {
  return Hive.box(HiveBoxName);
}
