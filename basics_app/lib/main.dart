import 'package:basics_app/home_screen.dart';
import 'package:basics_app/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



main() async {
 WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomeScreen(),
      // routes: {
      //   'screen_2':(context)=>const ScreenTwo()
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}

