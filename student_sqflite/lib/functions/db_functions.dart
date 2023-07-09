import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/student_model.dart';

// hive db name
const STUDENT_DB = 'student_db';
// check update or not
bool checkEditStudent = false;
// student list notifier
ValueNotifier<List<StudentModel>> studentValueNotifier = ValueNotifier([]);
late Database _db;

class Student {
  Future<void> initializedDatBase() async {
    _db = await openDatabase(
      'student_db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE student (id INTEGER PRIMARY KEY,name TEXT,age TEXT,branch TEXT,mark TEXT,image TEXT)');
      },
    );
  }

  // addStudent
  Future<void> AddStudentData(StudentModel value) async {
    await _db.rawInsert(
      'INSERT INTO student (name,age,branch,mark,image) VALUES(?,?,?,?,?)',
      [value.name, value.age, value.branch, value.mark, value.image],
    );
  }

//  get student data in studentValueNotifier
  Future<void> getStudent() async {
    final _values = await _db.rawQuery('SELECT * FROM student');
    studentValueNotifier.value.clear();
    // await  _db.rawDelete('DELETE FROM student');
    _values.forEach((map) {
      final student = StudentModel.fromMap(map);
      studentValueNotifier.value.add(student);
      studentValueNotifier.notifyListeners();
    });
  }

// access student data in using id
  Future<StudentModel> refresheData(id) async {
    final data = await _db.rawQuery('SELECT * FROM student WHERE id =?', [id]);
    getStudent();
    late StudentModel db;
    for (var i in data) {
      final student = StudentModel.fromMap(i);
      db = student;
    }
    return db;
  }
// delete student in using id
  Future<void> deleteStudent(int id) async {
    print(id);
    await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
    getStudent();
  }

// update student item put value in id
  Future<dynamic> updateStudent(StudentModel value, id) async {
    await _db.rawUpdate(
        'UPDATE student SET name=?, age=?, branch=?, mark=?, image=? WHERE id= ?',
        [
          value.name,
          value.age,
          value.branch,
          value.mark,
          value.image,
          id,
        ]);
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
