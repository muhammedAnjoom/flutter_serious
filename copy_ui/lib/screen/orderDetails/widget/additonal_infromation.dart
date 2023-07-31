import 'package:flutter/material.dart';

class AdditionalInfromation extends StatelessWidget {
  const AdditionalInfromation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ADDITIONAL INFORMATION",
            style: TextStyle(color: Colors.black38),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "State",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
    );
  }
}