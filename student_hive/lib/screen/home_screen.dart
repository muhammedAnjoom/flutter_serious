import 'package:flutter/material.dart';
import 'package:student_hive/functions/db_functions.dart';
import 'package:student_hive/screen/add_student.dart';
import 'package:student_hive/screen/student_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final studentFuction = Student();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Student",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 35,
                    weight: 100,
                    color: Color(0xffBAC3D2),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.clear,
                      size: 25,
                      color: Color(0xffBAC3D2),
                    ),
                  ),
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffBAC3D2),
                  ),
                  // focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: const Color(0xffF2F3F4),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: studentValueNotifier,
                    builder: (context, studentValue, _) {
                      studentFuction.getStudent();
                      return ListView.separated(
                        itemBuilder: (context, index) {
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
                              title: Text(student.name),
                              subtitle: Text(student.branch),
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text("Delete"),
                                      content: const Text(
                                          "you must want delete student"),
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
                                            studentFuction
                                                .deleteStudent(student.id);
                                            Navigator.of(ctx).pop();
                                            studentFuction.messageToStudent(
                                              message:
                                                  "${student.name} is successfull delete",
                                              color: Colors.red,
                                              context: context
                                            );
                                          },
                                          child: const Text(
                                            "yes",
                                            style:
                                                TextStyle(color: Colors.green),
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
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: studentValue.length,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx) => AddStudent(
                    scaffoldContext: _scaffoldKey.currentContext,
                  )),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
