import 'package:flutter/material.dart';
import 'package:proj_one/style.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Image.asset("assets/image/background.jpg"),
              Text(
                "Travel Task",
                style: gMainFont.copyWith(
                  fontSize: 45,
                ),
              ),
              Text(
                "Management",
                style: gMainFont.copyWith(
                  fontSize: 45,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Optimizing task management for",
                style: gSubFont.copyWith(fontSize: 20, letterSpacing: 0.1),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Improved travel performance",
                style: gSubFont.copyWith(fontSize: 20, letterSpacing: 1.2),
              ),
              const SizedBox(height: 50,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                height: 55,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: buttonColor.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: gSubFont.copyWith(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
