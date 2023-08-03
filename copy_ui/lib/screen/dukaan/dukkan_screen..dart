import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DukkanScreen extends StatelessWidget {
  const DukkanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 290,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.blue,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(width: 90),
                                  const Text(
                                    "Dukkan Premium",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: 1.5, color: Colors.black26)
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Image.network(
                            "https://mydukaan.io/blog/wp-content/uploads/2021/04/dukaan_blog.png",
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Text(
                            "Get Dukaan Premium for just",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                          const Text(
                            "4,999/year",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "All the advanced features for scaling your",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black45),
                          ),
                          const Text(
                            "business",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black45),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  children: const [
                    Text(
                      "Features",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
