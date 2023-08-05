import 'package:copy_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'widget/dukkan_card.dart';
import 'widget/feature_list.dart';

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
              const DukaanCard(),
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




