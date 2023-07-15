import 'package:flutter/material.dart';


class ButtonListInform extends StatelessWidget {
   ButtonListInform({
    super.key,
  });
  ValueNotifier<bool> switchAction = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.connect_without_contact,
          size: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        const Text(
          "WhatsApp Chat Support",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        const Spacer(),
        ValueListenableBuilder(
          valueListenable: switchAction,
          builder: (context,actionButton,_) {
            return Switch(
              value: actionButton,
              onChanged: (value) {
                switchAction.value=value;
              },
            );
          }
        )
      ],
    );
  }
}