import 'dart:io';
import 'package:flutter/material.dart';
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
    return ValueListenableBuilder(
        valueListenable: studentValueNotifier,
        builder: (context, studentValue, _) {
          if (showResult == true) {
            return ListView.separated(
              itemBuilder: (context, index) {
                // student value get the valuenotifier
                final student = studentValue[index];
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
                      // xfile image to show in fileimage widget file type path to string
                      backgroundImage:
                          FileImage(File(student.image.toString())),
                    ),
                    title: Text(student.name),
                    subtitle: Text(student.branch),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          // alert of student delete
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
