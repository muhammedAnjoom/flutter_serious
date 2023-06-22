import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proj_one/main.dart';
import 'package:proj_one/style.dart';
import 'package:proj_one/view/home_scren.dart';
import 'package:proj_one/view/landing_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _fromKey = GlobalKey<FormState>();
  bool _validation = false;
  bool _visibility = false;

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
                GestureDetector(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => const LandingScreen()),
                      (route) => false),
                  child: SvgPicture.asset(
                    "assets/icon/back-svgrepo-com.svg",
                    width: 45,
                  ),
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
                    child: Form(
                      key: _fromKey,
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
                            controller: _emailController,
                            validator: (value) {
                              setState(() {
                                _validation = EmailValidator.validate(
                                    _emailController.text);
                              });

                              if (value == null || value.isEmpty) {
                                return 'must enter value';
                              } else if (!_validation) {
                                return 'email invalid';
                              } else {
                                return null;
                              }
                            },
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
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'must enter value';
                              } else {
                                null;
                              }
                              return null;
                            },
                            obscureText: !_visibility,
                            decoration: InputDecoration(
                              hintText: "Password",
                              fillColor: Colors.white,
                              focusColor: const Color(0xffb299df),
                              hintStyle: const TextStyle(fontSize: 18),
                              suffixIcon: IconButton(
                                icon: Icon(_visibility
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _visibility = !_visibility;
                                  });
                                },
                                color: Colors.grey,
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          GestureDetector(
                            onTap: () {
                              _fromKey.currentState!.validate()
                                  ? saveDataToStroge(context)
                                  : null;
                            },
                            child: Container(
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
                          ),
                        ],
                      ),
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

  Future<void>? saveDataToStroge(context) async {
    final _email = _emailController.text;
    final _password = _passwordController.text;
    await sharedPreferences.setString('email', _email);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
  }
}
