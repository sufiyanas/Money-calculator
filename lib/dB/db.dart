import 'package:hive_flutter/adapters.dart';
part 'db.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  var name;
  @HiveField(1)
  var count;
  @HiveField(2)
  int? id;

  StudentModel({
    this.id,
    required this.name,
    required this.count,
  });
}
