import 'package:flutter/material.dart';

class PaymentOveriewCard extends StatelessWidget {
  const PaymentOveriewCard({
    super.key,
    required this.color,
    required this.title,
    required this.amount,
  });
  final Color color;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "₹$amount",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
