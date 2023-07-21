import 'package:flutter/material.dart';

class RoundRow extends StatelessWidget {
  const RoundRow({
    super.key,
    this.colorBackground = Colors.black12,
    this.colorText = Colors.black45,
    required this.title,
  });
  final Color colorBackground;
  final Color colorText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: colorText),
      )),
    );
  }
}