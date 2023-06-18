import 'package:basics_app/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
        appBar: AppBar(),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveDataToStorge();
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

  Future<void> saveDataToStorge() async {
    final sharedPerfs = await SharedPreferences.getInstance();
    // save value using sharedPreferences
    await sharedPerfs.setString('saved_value', _textController.text);
  }

  Future<void> getSavedData(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final savedValue = sharedPrefs.getString('saved_value');
    if (savedValue != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ScreenTwo()));
    }
  }
}
