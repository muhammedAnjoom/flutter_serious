import 'package:copy_ui/data/data.dart';
import 'package:copy_ui/screen/home/widget/home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ValueNotifier<int> currentIndex = ValueNotifier(0);

  final data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu))
        ],
        title: const Center(
          child: Text(
            "Manage Strore",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, _) {
            return BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                currentIndex.value = value;
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.date_range_sharp), label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.production_quantity_limits),
                    label: "Products"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.manage_search_outlined), label: "Manage"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined), label: "Account")
              ],
            );
          }),
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
            return HomeCard(
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
