import 'package:copy_ui/data/data.dart';
import 'package:copy_ui/screen/home/widget/home_card.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Manage Strore",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: data.homeList.length,
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: (1 / .8)),
          itemBuilder: (context, index) {
            final item = data.homeList[index];
            return  HomeCard(
              image: item.image,
              title: item.title,
              visible: item.visible,
            );
          },
        ),
      ),
    );
  }
}


