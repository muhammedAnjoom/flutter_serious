import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_hive/functions/db_functions.dart';

import '../../model/student_model.dart';
import 'widget/floating_button.dart';
import 'widget/list_student.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  bool showResult = true;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final studentFuction = Student();

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
                        final value = searchController.text = "";
                        searchStudent(value);
                      });
                      FocusManager.instance.primaryFocus?.unfocus();
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
                    builder: (context, newValue, _) {
                      return ListStudent(
                        searchController: searchController,
                        showResult: widget.showResult,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        scaffoldKey: _scaffoldKey,
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
    widget.showResult = true;
    studentValueNotifier.value = suggestion;
    if (suggestion.isEmpty) {
      widget.showResult = false;
    }
  }
}
