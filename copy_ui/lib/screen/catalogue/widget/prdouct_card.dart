import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
              padding:
                  const EdgeInsets.only(left: 10, top: 10, bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.meesho.com/images/products/235776582/z6icx_512.webp"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
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
                    children: const [
                      Text(
                        "The Boys Tshirt",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("1 piece"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹799",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "In stock",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}