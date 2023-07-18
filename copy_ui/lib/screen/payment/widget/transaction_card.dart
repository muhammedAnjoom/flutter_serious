import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 190,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transaction Limit",
            style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "A free limit up to which you will receive\nthe online payments directly in your bank",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
          const SizedBox(
            height: 10,
          ),
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(),
            percent: 0.30,
            progressColor: Colors.blue,
            lineHeight: 6,
            barRadius: const Radius.circular(3),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "36,668 left out of ₹50,000",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Increase limit"),
            ),
          )
        ],
      ),
    );
  }
}