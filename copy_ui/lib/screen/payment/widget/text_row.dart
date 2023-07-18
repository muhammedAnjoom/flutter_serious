import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.title,
    required this.trailing,
  });
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Spacer(),
        Text(
          trailing,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black54,
          size: 18,
        )
      ],
    );
  }
}