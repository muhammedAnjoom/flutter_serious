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
                        image: widget.image == null ? "" : widget.image!,
                        scaffoldContext: widget.scaffoldContext,
                        studentDb: widget.studentDb,
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
    // image source convert to xfile fromate
    XFile? _image = await ImagePicker().pickImage(source: source);
    if (_image == null) return;
    setState(() {
      // _image set in String image
      widget.image = _image.path;
    });
  }
}
