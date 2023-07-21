import 'package:flutter/material.dart';
import 'widget/payment_oveview_card..dart';
import 'widget/roundRow_text.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TransactionCard(),
              const SizedBox(
                height: 25,
              ),
              const TextRow(
                title: "Default Method",
                trailing: "Online Payments",
              ),
              const SizedBox(
                height: 25,
              ),
              const TextRow(
                title: "Payment Profile",
                trailing: "Bank Account",
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Payment Overview",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Life Time",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Expanded(
                    child: PaymentOveriewCard(
                      color: Colors.orange,
                      title: "AMOUNT ON HOLD",
                      amount: "0",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: PaymentOveriewCard(
                    color: Colors.green,
                    title: "AMOUNT RECEIVED",
                    amount: "13,332",
                  )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Transaction",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(
                    child: RoundRow(
                      title: "On hold",
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: RoundRow(
                      colorBackground: Colors.blue,
                      colorText: Colors.white,
                      title: "Payouts(15)",
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: RoundRow(
                      title: "Refunds",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


