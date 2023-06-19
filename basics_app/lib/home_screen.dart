import 'package:basics_app/main.dart';
import 'package:basics_app/screen_two.dart';
import 'package:basics_app/splash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });
  final _textController = TextEditingController();
  final _textConifromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: _textController,
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
                    controller: _textConifromController,
                    decoration: const InputDecoration(
                      hintText: "conform",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveDataToStorge(context);
                  },
                  child: const Text(
                    "login",
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> saveDataToStorge(context) async {
    // check data
    if (_textController.text == _textConifromController.text) {
      // save value using sharedPreferences
      await sharedPreferences.setString('saved_value', _textController.text);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenTwo()),
        (route) => false,
      );
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const SplahScreen()));
    }
  }
}
