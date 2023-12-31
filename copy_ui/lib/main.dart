import 'package:copy_ui/screen/catalogue/catalogue_screen.dart';
import 'package:copy_ui/screen/dukaan/dukkan_screen..dart';
import 'package:copy_ui/screen/home/home_screen.dart';
import 'package:copy_ui/screen/inforamtion/infromation_screen.dart';
import 'package:flutter/material.dart';

import 'screen/orderDetails/order_detalis_screen..dart';
import 'screen/payment/payment_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentScreen(),
    );
  }
}