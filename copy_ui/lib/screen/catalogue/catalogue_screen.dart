import 'package:copy_ui/data/data.dart';
import 'package:flutter/material.dart';

import 'widget/prdouct_card.dart';

class CatalogueScreen extends StatelessWidget {
  CatalogueScreen({super.key});
  final data = Data();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
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
                "Categories",
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
        body: ListView.builder(
          itemCount: data.productList.length,
          itemBuilder: (context, index) {
            final product = data.productList[index];
            return ProductCard(
              name: product.name,
              price: product.price,
              image: product.image,
            );
          },
        ),
      ),
    );
  }
}
