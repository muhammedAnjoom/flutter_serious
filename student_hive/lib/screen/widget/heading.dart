import 'package:flutter/material.dart';

import '../../functions/db_functions.dart';
import '../student_details.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.title,
    this.studentDb,
  });
  final String title;
  final studentDb;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (checkEditStudent == true) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => StudentDetails(student: studentDb),
                ),
              );
              checkEditStudent = false;
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 32,
        )
      ],
    );
  }
}
