import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "+91-7829000484",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Bangalore",
                    style: TextStyle(fontSize: 16, letterSpacing: 0.4),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Online",
                    style: TextStyle(fontSize: 16, letterSpacing: 0.3),
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: const BorderRadius.all(Radius.circular(3))),
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
    );
  }
}
