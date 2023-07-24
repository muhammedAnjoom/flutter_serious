import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
        ),
        centerTitle: true,
        title: const Text("Order #1688068"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: const [
                    Text(
                      "May 31,05:42 PM",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 6,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Delivered",
                      style: TextStyle(fontSize: 16, color: Colors.black38),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "1 ITEM",
                          style: TextStyle(fontSize: 16, color: Colors.black38),
                        ),
                        Spacer(),
                        Icon(
                          Icons.receipt_outlined,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "RECEIPT",
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                // border: Border(),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://img.fruugo.com/product/4/39/147028394_max.jpg",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Explore | Men | Navy Blue",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("1 piece"),
                            const Text(
                              "Size: XL",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.3),
                                      border: Border.all(color: Colors.blue)),
                                  child: Text(
                                    "1",
                                    style: TextStyle(color: Colors.blue[700]),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "x ₹799",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          "₹799",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
