import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'widget/text_row.dart';
import 'widget/transaction_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("payments"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: const [
              TransactionCard(),
              SizedBox(
                height: 25,
              ),
              TextRow(
                title: "Default Method",
                trailing: "Online Payments",
              ),
              SizedBox(
                height: 25,
              ),
              TextRow(
                title: "Payment Profile",
                trailing: "Bank Account",
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}


