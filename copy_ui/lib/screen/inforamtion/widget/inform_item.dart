import 'package:flutter/material.dart';

class InforamtionList extends StatelessWidget {
  const InforamtionList({
    super.key,
    required this.icon,
    required this.title,
    required this.visible,
  });
  final IconData icon;
  final String title;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        const Spacer(),
        Visibility(
          visible: visible,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}