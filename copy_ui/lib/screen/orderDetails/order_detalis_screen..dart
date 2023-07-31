import 'package:copy_ui/screen/orderDetails/widget/amount_continer.dart';
import 'package:copy_ui/screen/orderDetails/widget/product_detalis_continer.dart';
import 'package:flutter/material.dart';

import 'widget/additonal_infromation.dart';
import 'widget/customer_deatils.dart';
import 'widget/date_detalis_container.dart';
import 'widget/submit_button,.dart';

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
            children: const [
              DateDetailsContainer(),
              Divider(
                thickness: 1,
              ),
              ProductDetailsContainer(),
              Divider(
                thickness: 1,
              ),
              AmountContainer(),
              Divider(
                thickness: 1,
              ),
              CustomerDetails(),
              Divider(
                thickness: 1,
              ),
              AdditionalInfromation(),
              SizedBox(
                height: 30,
              ),
              SubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}
