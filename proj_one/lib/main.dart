import 'package:flutter/material.dart';
import 'package:proj_one/view/home_scren.dart';
import 'package:proj_one/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/landing_screen.dart';
late SharedPreferences sharedPreferences;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences =await SharedPreferences.getInstance(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:const LandingScreen(),
    );
  }
}


