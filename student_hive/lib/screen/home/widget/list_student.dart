import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../functions/db_functions.dart';
import '../../student_details.dart';

class ListStudent extends StatelessWidget {
  ListStudent({
    super.key,
    required this.showResult,
    required this.searchController,
  });

  final bool showResult;
  final TextEditingController searchController;
  final studentFuction = Student();

  @override
  Widget build(BuildContext context) {
    print(showResult);
    return ValueListenableBuilder(
        valueListenable: studentValueNotifier,
        builder: (context, studentValue, _) {
          if (showResult == true || searchController.text == "") {
            return ListView.separated(
              itemBuilder: (context, index) {
                final student = studentValue[index];
                // print(student.id);
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => StudentDetails(
                        student: student,
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(File(student.image.toString())),
                    ),
                    title: Text(student.name),
                    subtitle: Text(student.branch),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Delete ${student.name}"),
                            content: const Text("you must want delete student"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text(
                                  "no",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  studentFuction.deleteStudent(student.id);
                                  Navigator.of(ctx).pop();
                                  studentFuction.messageToStudent(
                                      message:
                                          "${student.name} is successfull delete",
                                      color: Colors.red,
                                      context: context);
                                },
                                child: const Text(
                                  "yes",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: studentValue.length,
            );
          } else {
            return const Center(
              child: Text(
                "No Student Found!!",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          }
        });
  }
}
