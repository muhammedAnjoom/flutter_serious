import 'package:copy_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DukkanScreen extends StatelessWidget {
  DukkanScreen({super.key});

  final data = Data();

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Features",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: data.featureListData.length,
                      itemBuilder: (context, index) {
                        final listFeature = data.featureListData[index];
                        return FeatureList(
                          image: listFeature.image,
                          title: listFeature.title,
                          subtitle: listFeature.subtitle,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 13,
                        );
                      },
                    )
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

class FeatureList extends StatelessWidget {
  const FeatureList({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1.8),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              image,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black38,
                height: 1.3,
                fontSize: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}
