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
          child: ListView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(
                      height: 10,
                    ),
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
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/whatsapp.svg",
                          width: 40,
                          height: 40,
                          color: Colors.green,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Addres",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "D 1101 Chartered Baverly\nHills,Subramanyapura P.O",
                          style: TextStyle(fontSize: 16, letterSpacing: 0.4),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "City",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Bangalore",
                              style:
                                  TextStyle(fontSize: 16, letterSpacing: 0.4),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Pincode",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "560061",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Payment",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Online",
                              style:
                                  TextStyle(fontSize: 16, letterSpacing: 0.3),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3))),
                          child: Text(
                            "PAID",
                            style: TextStyle(
                                letterSpacing: 0.3,
                                color: Colors.greenAccent[700],
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ADDITIONAL INFORMATION",
                      style: TextStyle(color: Colors.black38),
                    ),
                    SizedBox(height: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "State",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Karnataka",
                          style: TextStyle(fontSize: 16, letterSpacing: 0.3),
                        )
                      ],
                    ),
                    SizedBox(height: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "greeniceaqua@gmail.com",
                          style: TextStyle(fontSize: 16, letterSpacing: 0.3),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  // padding: EdgeInsets.symmetric(vertical: 20),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.blue,width: 1.4
                    )
                  ),
                  child: Center(child: Text("Share receipt",style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w500
                  ),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
