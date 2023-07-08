import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../functions/db_functions.dart';
import '../../../model/student_model.dart';
import '../../home/home_screen.dart';
import '../../student_details.dart';

class StudentForm extends StatelessWidget {
  StudentForm({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.branchController,
    required this.markController,
    required this.image,
    required this.scaffoldContext,
    this.studentDb
  });
  final student = Student();
  final _fromKey = GlobalKey<FormState>();
  // update student get the data
  final StudentModel? studentDb;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController branchController;
  final TextEditingController markController;
  final String image;
  // snackbar show in context
  final  scaffoldContext;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Full name",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: nameController,
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
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Age",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: ageController,
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
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Branch",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: branchController,
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
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Mark",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: markController,
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
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              // check the fromkey and validate
              if (_fromKey.currentState!.validate()) {
                final name = nameController.text;
                final age = ageController.text;
                final branch = branchController.text;
                final mark = markController.text;
                // image check null and show snakbar message
                if (image != "") {
                  if (checkEditStudent == false) {
                    // add student
                    student.AddStudentData(StudentModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: name,
                        age: age,
                        branch: branch,
                        mark: mark,
                        image: image));
                        // success message
                    student.messageToStudent(
                      message: "successfully add student",
                      color: Colors.green,
                      context: scaffoldContext,
                    );
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (ctx) {
                        return HomeScreen();
                      },
                    ), (route) => false);
                  } else {
                    // update student
                    student.updateStudent(
                      StudentModel(
                          id: studentDb!.id,
                          name: name,
                          age: age,
                          branch: branch,
                          mark: mark,
                          image: image),
                      studentDb!.id,
                    );
                    final newStudent =
                        await student.refresheData(studentDb!.id);
                    // ignore: use_build_context_synchronously
                    student.messageToStudent(
                        message: "student update successfully ",
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
              } else {
                null;
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Center(
                  child: Text(
                "Save",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
            ),
          )
        ],
      ),
    );
  }
}
