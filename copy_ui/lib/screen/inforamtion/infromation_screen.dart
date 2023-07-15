import 'package:flutter/material.dart';

import 'widget/inform_item.dart';
import 'widget/switch_button_item.dart';

class InforamtionScreen extends StatelessWidget {
  const InforamtionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: const Center(child: Text("Additional Inforamation")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const InforamtionList(
                icon: Icons.share_outlined,
                title: "Share Dukaan App",
                visible: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const InforamtionList(
                icon: Icons.messenger_outline_outlined,
                title: "Change Language",
                visible: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const InforamtionList(
                icon: Icons.lock_outlined,
                title: "Privacy Policy",
                visible: false,
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonListInform(),
              const SizedBox(
                height: 15,
              ),
              const InforamtionList(
                icon: Icons.star_border,
                title: "Rate Us",
                visible: false,
              ),
              const SizedBox(
                height: 20,
              ),
              const InforamtionList(
                icon: Icons.logout,
                title: "Sign Out",
                visible: false,
              ),
              const Spacer(),
              Column(
                children: const [
                  Text(
                    "Version",
                    style: TextStyle(color: Colors.grey, letterSpacing: 2),
                  ),
                  Text(
                    "2.4.2",
                    style: TextStyle(letterSpacing: 1, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
