import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_hive/model/student_model.dart';
import 'package:student_hive/screen/home_screen.dart';

import '../functions/db_functions.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final student = Student();

  ValueNotifier<bool> validation = ValueNotifier(false);
  final _fromKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _markController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 32.0),
                    child: Text(
                      "Add Student",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        "Add Profile Picture",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ValueListenableBuilder(
                    valueListenable: validation,
                    builder: (context, validations, _) {
                      return Form(
                        key: _fromKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Full name",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "value not empty";
                                } else {
                                  null;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: "Full name",
                                fillColor: Colors.white,
                                focusColor: Color.fromARGB(255, 216, 209, 230),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Age",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _ageController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "value not empty";
                                } else {
                                  null;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: "Age",
                                fillColor: Colors.white,
                                focusColor: Color.fromARGB(255, 216, 209, 230),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Branch",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _branchController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "value not empty";
                                } else {
                                  null;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: "Branch",
                                fillColor: Colors.white,
                                focusColor: Color.fromARGB(255, 216, 209, 230),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Mark",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _markController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "value not empty";
                                } else {
                                  null;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: "Mark",
                                fillColor: Colors.white,
                                focusColor: Color.fromARGB(255, 216, 209, 230),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_fromKey.currentState!.validate()) {
                                  final name = _nameController.text;
                                  final age = _ageController.text;
                                  final branch = _branchController.text;
                                  final mark = _markController.text;
                                  student.AddStudentData(StudentModel(
                                    id: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    name: name,
                                    age: age,
                                    branch: branch,
                                    mark: mark,
                                  ));
                                  print("student model create");
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (ctx) => HomeScreen(),
                                      ),
                                      (route) => false);
                                } else {
                                  null;
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: const Center(
                                    child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
