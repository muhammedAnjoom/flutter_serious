import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Catalogue"),
            bottom: const TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 15),
              tabs: [
                Text(
                  "products",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "cataeriors",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
          body: const TabBarView(
            children: [Text("halo")],
          )),
    );
  }
}
