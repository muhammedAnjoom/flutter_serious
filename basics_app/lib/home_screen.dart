import 'package:basics_app/main.dart';
import 'package:basics_app/screen_two.dart';
import 'package:basics_app/splash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  final _textConifromController = TextEditingController();

  bool _validate = true;
  final _fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    // _textConifromController.dispose();
    // _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextFormField(
                  controller: _textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'error';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "userName",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextFormField(
                  obscureText: true,
                  controller: _textConifromController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'error';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    // errorText: !_validate ? 'can\'t be empty' : null,
                    hintText: "conform",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_validate,
                      child: const Text(
                        "Invalied username and password",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _fromKey.currentState!.validate()
                            ? saveDataToStorge(context)
                            : null;
                        // setState(() {
                        //   _textController.text.isEmpty?_validate =true:_validate=false;
                        //    _textConifromController.text.isEmpty?_validate =true:_validate=false;
                        // });
                      },
                      child: const Text(
                        "login",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> saveDataToStorge(context) async {
    // check data
    final _username = _textController.text;
    final _confirm = _textConifromController.text;
    if (_username == _confirm) {
      // save value using sharedPreferences
      await sharedPreferences.setString('saved_value', _textController.text);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenTwo()),
        (route) => false,
      );
    } else {
      final _errorMessage = "Invalied username and password";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.grey,
          content: Text(_errorMessage),
        ),
      );

      // showDialog(
      //   context: context,
      //   builder: (ctx) {
      //     return AlertDialog(
      //       title: const Text("Error"),
      //       content: Text(_errorMessage),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx).pop();
      //           },
      //           child: const Text("close"),
      //         )
      //       ],
      //     );
      //   },
      // );
      setState(() {
        _validate = false;
      });
    }
  }
}
