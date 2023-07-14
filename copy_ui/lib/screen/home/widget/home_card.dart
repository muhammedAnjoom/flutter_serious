import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.image,
      required this.title,
      required this.visible});
  final String image;
  final String title;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.only(top: 15, left: 15),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                image,
                width: 40,
                height: 40,
              ),
              Visibility(
                visible: visible,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: const Text(
                      "NEW",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
