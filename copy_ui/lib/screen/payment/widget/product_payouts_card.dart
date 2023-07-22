import 'package:flutter/material.dart';

class ProductOrderCard extends StatelessWidget {
  const ProductOrderCard({
    super.key,
    required this.image,
    required this.orderId,
    required this.date,
    required this.price,
  });
  final String image;
  final String orderId;
  final String date;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order #$orderId",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.black38),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₹$price",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Successful",
                      style: TextStyle(color: Colors.black38),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "₹$price deposited to 5889200962",
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
