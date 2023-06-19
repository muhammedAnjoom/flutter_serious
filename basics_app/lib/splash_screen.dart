import 'dart:async';

import 'package:basics_app/home_screen.dart';
import 'package:basics_app/main.dart';
import 'package:basics_app/screen_two.dart';
import 'package:flutter/material.dart';


class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    // getSavedData(context);
    Timer(const Duration(seconds: 3), getSavedData);
  }

  @override
  Widget build(BuildContext context) {
    // getSavedData(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height),
      ),
    );
  }

  void getSavedData() {
    final savedValue = sharedPreferences.getString('saved_value');
    if (savedValue != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenTwo()));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
      );
    }
  }
}
