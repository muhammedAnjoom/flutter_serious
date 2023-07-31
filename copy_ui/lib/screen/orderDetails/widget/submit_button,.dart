import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        height: 45,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.blue, width: 1.4)),
        child: Center(
            child: Text(
          "Share receipt",
          style: TextStyle(
              fontSize: 16,
              color: Colors.blue[900],
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}