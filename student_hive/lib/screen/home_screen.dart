import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_hive/functions/db_functions.dart';
import 'package:student_hive/screen/add_student.dart';
import 'package:student_hive/screen/student_details.dart';

import '../model/student_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final studentFuction = Student();

  bool showResult = true;

  final TextEditingController searchController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    studentFuction.getStudent();
    super.initState();
  }

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
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 35,
                    weight: 100,
                    color: Color(0xffBAC3D2),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                      });
                    },
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
                  // enabledBorder: InputBorder.none,
                  fillColor: const Color(0xffF2F3F4),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onChanged: searchStudent,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: studentValueNotifier,
                    builder: (context, studentValue, _) {

                      if (showResult == true || searchController.text.isEmpty) {
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
                                  backgroundImage: FileImage(
                                    File(student.image.toString())
                                  ),
                                ),
                                title: Text(student.name),
                                subtitle: Text(student.branch),
                                trailing: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title:  Text("Delete ${student.name}"),
                                        content: const Text(
                                            "you must want delete student"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text(
                                              "no",
                                              style:
                                                  TextStyle(color: Colors.red),
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
                                                  context: context);
                                            },
                                            child: const Text(
                                              "yes",
                                              style: TextStyle(
                                                  color: Colors.green),
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
                          child: Text("No Student Found!!",style: TextStyle(
                            color: Colors.red,
                            fontSize: 20
                          ),),
                        );
                      }
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
                    heading: "Add Student",
                    scaffoldContext: _scaffoldKey.currentContext,
                  )),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  void searchStudent(String query) async {
    final _studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
    final suggestion = _studentDB.values.where((data) {
      final studentName = data.name.toLowerCase();
      final input = query.toLowerCase();
      return studentName.contains(input);
    }).toList();
    showResult=true;
    studentValueNotifier.value = suggestion;
    if (suggestion.isEmpty) {
      showResult = false;
    }
  }
}
