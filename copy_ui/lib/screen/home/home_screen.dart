import 'package:copy_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing:20,
              childAspectRatio: (1/.55)
            ),
            itemBuilder: (context, index) {
              return  HomeCard();
            },
            itemCount: 7,
          ),
        ));
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Wikisource_speaker_icon.svg/1024px-Wikisource_speaker_icon.svg.png",
            width: 20,
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Marketing\nDesigin",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
