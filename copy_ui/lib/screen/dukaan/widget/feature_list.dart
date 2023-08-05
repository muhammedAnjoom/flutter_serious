import 'package:flutter/material.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1.8),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              image,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black38,
                height: 1.3,
                fontSize: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}