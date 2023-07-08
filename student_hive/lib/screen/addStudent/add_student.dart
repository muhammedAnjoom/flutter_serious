import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_hive/model/student_model.dart';
import 'package:student_hive/screen/addStudent/widget/pick_image.dart';
import 'package:student_hive/screen/addStudent/widget/student_from.dart';
import 'package:image_picker/image_picker.dart';
import '../../functions/db_functions.dart';
import '../widget/heading.dart';

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


  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _branchController = TextEditingController();

  final TextEditingController _markController = TextEditingController();

  @override
  void initState() {
    // update student set all preview data in field
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
            children: [
              // edit the student and pass student data
              checkEditStudent == true
                  ? HeadingText(
                      title: widget.heading,
                      studentDb: widget.studentDb,
                    )
                  // other not pass student data
                  : HeadingText(title: widget.heading),
              const SizedBox(
                height: 10,
              ),
              // pick the profile picture
              // pass the image and function
              ProfilePicture(
                image: widget.image,
                pickImagProfile: pickImagProfile,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ValueListenableBuilder(
                    valueListenable: validation,
                    builder: (context, validations, _) {
                      // form student
                      return StudentForm(
                        nameController: _nameController,
                        ageController: _ageController,
                        branchController: _branchController,
                        markController: _markController,
                        image: widget.image==null?"":widget.image!,
                        scaffoldContext: widget.scaffoldContext,
                        studentDb: widget.studentDb,
                      );
                      // return Form(
                      //   key: _fromKey,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //         "Full name",
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.w500),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       TextFormField(
                      //         controller: _nameController,
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return "value not empty";
                      //           } else {
                      //             null;
                      //           }
                      //           return null;
                      //         },
                      //         decoration: const InputDecoration(
                      //           contentPadding: EdgeInsets.only(left: 20),
                      //           hintText: "Full name",
                      //           fillColor: Colors.white,
                      //           focusColor: Color.fromARGB(255, 216, 209, 230),
                      //           border: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.grey),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //             borderSide:
                      //                 BorderSide(color: Colors.blueGrey),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       const Text(
                      //         "Age",
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.w500),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       TextFormField(
                      //         controller: _ageController,
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return "value not empty";
                      //           } else {
                      //             null;
                      //           }
                      //           return null;
                      //         },
                      //         keyboardType: TextInputType.number,
                      //         decoration: const InputDecoration(
                      //           contentPadding: EdgeInsets.only(left: 20),
                      //           hintText: "Age",
                      //           fillColor: Colors.white,
                      //           focusColor: Color.fromARGB(255, 216, 209, 230),
                      //           border: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.grey),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //             borderSide:
                      //                 BorderSide(color: Colors.blueGrey),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       const Text(
                      //         "Branch",
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.w500),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       TextFormField(
                      //         controller: _branchController,
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return "value not empty";
                      //           } else {
                      //             null;
                      //           }
                      //           return null;
                      //         },
                      //         decoration: const InputDecoration(
                      //           contentPadding: EdgeInsets.only(left: 20),
                      //           hintText: "Branch",
                      //           fillColor: Colors.white,
                      //           focusColor: Color.fromARGB(255, 216, 209, 230),
                      //           border: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.grey),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //             borderSide:
                      //                 BorderSide(color: Colors.blueGrey),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       const Text(
                      //         "Mark",
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.w500),
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       TextFormField(
                      //         controller: _markController,
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return "value not empty";
                      //           } else {
                      //             null;
                      //           }
                      //           return null;
                      //         },
                      //         keyboardType: TextInputType.number,
                      //         decoration: const InputDecoration(
                      //           contentPadding: EdgeInsets.only(left: 20),
                      //           hintText: "Mark",
                      //           fillColor: Colors.white,
                      //           focusColor: Color.fromARGB(255, 216, 209, 230),
                      //           border: OutlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.grey),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30)),
                      //             borderSide:
                      //                 BorderSide(color: Colors.blueGrey),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 30,
                      //       ),
                      //       GestureDetector(
                      //         onTap: () async {
                      //           if (_fromKey.currentState!.validate()) {
                      //             final name = _nameController.text;
                      //             final age = _ageController.text;
                      //             final branch = _branchController.text;
                      //             final mark = _markController.text;

                      //             if (widget.image != null) {
                      //               if (checkEditStudent == false) {
                      //                 student.AddStudentData(StudentModel(
                      //                     id: DateTime.now()
                      //                         .millisecondsSinceEpoch
                      //                         .toString(),
                      //                     name: name,
                      //                     age: age,
                      //                     branch: branch,
                      //                     mark: mark,
                      //                     image: widget.image!));
                      //                 student.messageToStudent(
                      //                   message: "successfully add student",
                      //                   color: Colors.green,
                      //                   context: widget.scaffoldContext,
                      //                 );
                      //                 Navigator.of(context).pushAndRemoveUntil(
                      //                     MaterialPageRoute(
                      //                   builder: (ctx) {
                      //                     return HomeScreen();
                      //                   },
                      //                 ), (route) => false);
                      //               } else {
                      //                 student.updateStudent(
                      //                   StudentModel(
                      //                       id: widget.studentDb!.id,
                      //                       name: name,
                      //                       age: age,
                      //                       branch: branch,
                      //                       mark: mark,
                      //                       image: widget.image!),
                      //                   widget.studentDb!.id,
                      //                 );
                      //                 final newStudent = await student
                      //                     .refresheData(widget.studentDb!.id);
                      //                 // ignore: use_build_context_synchronously
                      //                 student.messageToStudent(
                      //                     message:
                      //                         "student update successfully ",
                      //                     color: Colors.green,
                      //                     context: context);
                      //                 // ignore: use_build_context_synchronously
                      //                 Navigator.of(context).pushReplacement(
                      //                   MaterialPageRoute(
                      //                     builder: (ctx) => StudentDetails(
                      //                       student: newStudent!,
                      //                     ),
                      //                   ),
                      //                 );
                      //               }
                      //             } else {
                      //               student.messageToStudent(
                      //                 context: context,
                      //                 message: "Must add profile image",
                      //                 color: Colors.red,
                      //               );
                      //             }
                      //           } else {
                      //             null;
                      //           }
                      //         },
                      //         child: Container(
                      //           padding:
                      //               const EdgeInsets.symmetric(vertical: 15),
                      //           width: double.maxFinite,
                      //           decoration: const BoxDecoration(
                      //               color: Colors.greenAccent,
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(30))),
                      //           child: const Center(
                      //               child: Text(
                      //             "Save",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w500),
                      //           )),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImagProfile(ImageSource source) async {
    // image source convert to xfile fromate
    XFile? _image = await ImagePicker().pickImage(source: source);
    if (_image == null) return;
    setState(() {
      // _image set in String image
      widget.image = _image.path;
    });
  }
}
