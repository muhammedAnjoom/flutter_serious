import 'package:basics_app/home_screen.dart';
import 'package:basics_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await sharedPreferences.remove('saved_value');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
              },
              icon:const  Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=686&q=80"),
              ),
              title: Text("person $index"),
              subtitle: const Text("halo"),
              trailing: Text("$index : 00"),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 20,
        ),
      ),
    );
  }
}
