import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proj_one/style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          // height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icon/back-svgrepo-com.svg",
                  width: 45,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Let's Sing you in.",
                  style: gMainFont.copyWith(fontSize: 40),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome back.",
                  style: gSubFont.copyWith(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "You've ben missed!",
                  style: gSubFont.copyWith(fontSize: 28),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: gSubFont.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: "Your email",
                            fillColor: Colors.white,
                            focusColor: Color(0xffb299df),
                            hintStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: gSubFont.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: "Password",
                            fillColor: Colors.white,
                            focusColor: Color(0xffb299df),
                            hintStyle: TextStyle(fontSize: 18),
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 100,),
                        Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: buttonColor.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "Sign in",
                              style: gSubFont.copyWith(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
