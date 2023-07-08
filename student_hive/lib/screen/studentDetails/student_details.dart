import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_hive/functions/db_functions.dart';
import 'package:student_hive/model/student_model.dart';
import 'package:student_hive/screen/addStudent/add_student.dart';

import 'widget/studentField.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ValueListenableBuilder(
              valueListenable: studentValueNotifier,
              builder: (context, newStudent, _) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                        const Text(
                          "Student Details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                FileImage(File(student.image.toString())),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              student.name,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                checkEditStudent = true;
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (ctx) => AddStudent(
                                              heading: "Update student",
                                              studentDb: student,
                                            )));
                              },
                              // color: Colors.red,
                              child: const Text(
                                "+ Edit profile",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          FieldStudent(
                            type: "Username",
                            value: student.name,
                            icon: Icons.account_circle_outlined,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FieldStudent(
                            type: "Age",
                            value: student.age,
                            icon: Icons.person_3_outlined,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FieldStudent(
                            type: "Branch",
                            value: student.branch,
                            icon: Icons.military_tech_outlined,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FieldStudent(
                            type: "Mark",
                            value: student.mark,
                            icon: Icons.grade_outlined,
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
