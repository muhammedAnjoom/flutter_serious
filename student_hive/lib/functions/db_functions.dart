import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_hive/model/student_model.dart';

const STUDENT_DB = 'student_db';
ValueNotifier<List<StudentModel>> studentValueNotifier = ValueNotifier([]);

class Student {
  Future<void> AddStudentData(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    await studentDB.put(value.id, value);
    studentValueNotifier.value.add(value);
    studentValueNotifier.notifyListeners();
  }

  Future<void> getStudent() async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    // studentDB.clear();
    studentValueNotifier.value.clear();
    studentValueNotifier.value.addAll(studentDB.values);
    studentValueNotifier.notifyListeners();
  }

  Future<void> deleteStudent(id) async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    await studentDB.delete(id);
    print("$id remove");
    await getStudent();
  }
}
