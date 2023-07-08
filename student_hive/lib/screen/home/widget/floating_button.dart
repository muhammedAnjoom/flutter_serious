import 'package:flutter/material.dart';

import '../../add_student.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) => AddStudent(
                  heading: "Add Student",
                  scaffoldContext: _scaffoldKey.currentContext,
                )),
      ),
      child: const Icon(Icons.add),
    );
  }
}
