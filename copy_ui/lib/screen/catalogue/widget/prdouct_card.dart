import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });
  final String name;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text("1 piece"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹$price",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "In stock",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              indent: 13,
              endIndent: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.share_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Share Product",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
