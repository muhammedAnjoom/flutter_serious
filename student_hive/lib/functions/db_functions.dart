import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_hive/model/student_model.dart';

const STUDENT_DB = 'student_db';
bool checkEditStudent = false;
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

  Future<dynamic> updateStudent(StudentModel value,id)async{
     final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
      await studentDB.put(id, value);
      await getStudent();
  }

  Future<void> messageToStudent({
    context,
    required String message,
    required Color color,
  }) async {
    final snakbar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }
}
