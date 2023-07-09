import 'package:flutter/material.dart';

class FieldStudent extends StatelessWidget {
  FieldStudent({
    super.key,
    required this.type,
    required this.value,
    required this.icon,
  });

  final String type;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: const Color(0xffBAC3D2),
        ),
        const SizedBox(
          width: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              type,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
            const Divider()
          ],
        ),
      ],
    );
  }
}