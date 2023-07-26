import 'package:copy_ui/screen/orderDetails/widget/amount_continer.dart';
import 'package:copy_ui/screen/orderDetails/widget/product_detalis_continer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'widget/date_detalis_container.dart';

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
              const DateDetailsContainer(),
              const Divider(
                thickness: 1,
              ),
              const ProductDetailsContainer(),
              const Divider(
                thickness: 1,
              ),
              const AmountContainer(),
              const Divider(
                thickness: 1,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "CUSTOMER DETAILS",
                          style: TextStyle(color: Colors.black38),
                        ),
                        Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share_outlined,
                            size: 20,
                          ),
                          label: Text("SHARE"),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Deepa",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "+91-7829000484",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/call1.svg",
                          width: 30,
                          height: 30,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 10,),
                        SvgPicture.asset(
                          "assets/whatsapp.svg",
                          width: 40,
                          height: 40,
                          color: Colors.green,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
