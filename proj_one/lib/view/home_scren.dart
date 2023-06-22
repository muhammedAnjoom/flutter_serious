import 'package:flutter/material.dart';
import 'package:proj_one/style.dart';

import '../core.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final person = Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    "Message",
                    style: gMainFont.copyWith(fontSize: 26),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Recent update",
                style: gSubFont.copyWith(fontSize: 20),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 37,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/image/image_$index.jpg"),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 6,
                  ),
                ),
              ),
              Text(
                "Chatting",
                style: gSubFont.copyWith(fontSize: 20),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: double.maxFinite,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/image/image_$index.jpg"),
                          ),
                          title: Text(
                            person.name[index],
                            style: gMainFont,
                          ),
                          subtitle: Text(
                            person.subTitle[index],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text(
                            person.title[index],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 7,
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
