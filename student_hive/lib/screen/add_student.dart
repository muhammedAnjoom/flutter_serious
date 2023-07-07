import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_hive/model/student_model.dart';
import 'package:student_hive/screen/home/home_screen.dart';
import 'package:student_hive/screen/student_details.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/db_functions.dart';

class AddStudent extends StatefulWidget {
  AddStudent(
      {super.key, this.scaffoldContext, this.studentDb, required this.heading});
  final StudentModel? studentDb;
  final scaffoldContext;
  final String heading;
  String? image;

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final student = Student();

  ValueNotifier<bool> validation = ValueNotifier(false);

  final _fromKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _branchController = TextEditingController();

  final TextEditingController _markController = TextEditingController();

  @override
  void initState() {
    if (checkEditStudent == true) {
      setState(() {
        _nameController.text = widget.studentDb!.name;
        _ageController.text = widget.studentDb!.age;
        _branchController.text = widget.studentDb!.branch;
        _markController.text = widget.studentDb!.mark;
        widget.image = widget.studentDb!.image;
      });
    } else {
      null;
    }
    super.initState();
  }

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
                    onPressed: () {
                      if (checkEditStudent == true) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) =>
                                StudentDetails(student: widget.studentDb!)));
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Text(
                      widget.heading,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: widget.image == null
                          ? Colors.blue
                          : Colors.transparent,
                      radius: 40,
                      backgroundImage: widget.image == null
                          ? null
                          : FileImage(File(widget.image.toString())),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      return showModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text("Camera"),
                              onTap: () => pickImagProfile(ImageSource.camera),
                            ),
                            ListTile(
                              leading: Icon(Icons.image),
                              title: Text("Image"),
                              onTap: () => pickImagProfile(ImageSource.gallery),
                            )
                          ],
                        ),
                      );
                    },
                    child: Container(
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
                              onTap: () async {
                                if (_fromKey.currentState!.validate()) {
                                  final name = _nameController.text;
                                  final age = _ageController.text;
                                  final branch = _branchController.text;
                                  final mark = _markController.text;

                                  if (widget.image != null) {
                                    if (checkEditStudent == false) {
                                      student.AddStudentData(StudentModel(
                                          id: DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          name: name,
                                          age: age,
                                          branch: branch,
                                          mark: mark,
                                          image: widget.image!));
                                      student.messageToStudent(
                                        message: "successfully add student",
                                        color: Colors.green,
                                        context: widget.scaffoldContext,
                                      );
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                        builder: (ctx) {
                                          return HomeScreen();
                                        },
                                      ), (route) => false);
                                    } else {
                                      student.updateStudent(
                                        StudentModel(
                                            id: widget.studentDb!.id,
                                            name: name,
                                            age: age,
                                            branch: branch,
                                            mark: mark,
                                            image: widget.image!),
                                        widget.studentDb!.id,
                                      );
                                      final newStudent = await student
                                          .refresheData(widget.studentDb!.id);
                                      // ignore: use_build_context_synchronously
                                      student.messageToStudent(
                                          message:
                                              "student update successfully ",
                                          color: Colors.green,
                                          context: context);
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (ctx) => StudentDetails(
                                            student: newStudent!,
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                  student.messageToStudent(
                                    context: context,
                                    message: "Must add profile image",
                                    color: Colors.red,
                                  );
                                  }
                                }else{
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

  Future<void> pickImagProfile(ImageSource source) async {
    XFile? _image = await ImagePicker().pickImage(source: source);
    if (_image == null) return;
    final imageTempory = File(_image.path);
    // imageTempory.readAsBytesSync();
    setState(() {
      widget.image = _image.path;
    });
  }
}
