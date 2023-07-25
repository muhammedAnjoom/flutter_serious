import 'package:flutter/material.dart';

class DateDetailsContainer extends StatelessWidget {
  const DateDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}