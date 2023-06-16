import 'package:basics_app/screen_two.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ScreenTwo(username: "person $index"),
                    ),
                  );
                },
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80",
                    ),
                  ),
                  title: Text("user $index"),
                  trailing: Text("0${index + 1}:00"),
                  subtitle: Text("halo, user $index"),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 20,
                thickness: 1,
                endIndent: 20,
              );
            },
            itemCount: 50,
          )),
    );
  }
}
