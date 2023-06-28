import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String branch;
  @HiveField(4)
  final String mark;

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
    required this.branch,
    required this.mark,
  });
}
