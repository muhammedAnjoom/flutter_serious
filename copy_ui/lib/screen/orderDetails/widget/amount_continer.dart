import 'package:flutter/material.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Item Total",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "₹799",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Delivery",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "FREE",
                style: TextStyle(color: Colors.green, fontSize: 16),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Grand Total",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "₹799",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}