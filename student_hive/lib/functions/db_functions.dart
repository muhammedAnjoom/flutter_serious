import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_hive/model/student_model.dart';

// hive db name
const STUDENT_DB = 'student_db';
// check update or not
bool checkEditStudent = false;
// student list notifier
ValueNotifier<List<StudentModel>> studentValueNotifier = ValueNotifier([]);

class Student {
  // addStudent
  Future<void> AddStudentData(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    await studentDB.put(value.id, value);
  }

//  get student data in studentValueNotifier
  Future<void> getStudent() async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    studentValueNotifier.value.clear();
    studentValueNotifier.value.addAll(studentDB.values);
    studentValueNotifier.notifyListeners();
  }

// access student data in using id
  Future<StudentModel?> refresheData(id) async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    final data = await studentDB.get(id);
    getStudent();
    return data;
  }
// delete student in using id
  Future<void> deleteStudent(id) async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    await studentDB.delete(id);
    print("$id remove");
    await getStudent();
  }
// update student item put value in id
  Future<dynamic> updateStudent(StudentModel value, id) async {
    final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    await studentDB.put(id, value);
    checkEditStudent = false;
    await getStudent();
  }
// snackbar message in ui
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
