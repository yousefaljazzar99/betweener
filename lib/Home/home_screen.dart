import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/features/home/qr_widget.dart';
import 'package:bootcamp_starter/features/home/search_scan.dart';

import 'package:flutter/material.dart';

 
import '../features/home/link_fast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Facebook', "Instagram", "WhatsApp"];
    List<String> urls = [
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp
    ];
    return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SearchScanContainerWidget(),
                SizedBox(
                  height: 35,
                ),
                QrWidget(),
              ],
            ),
          ),
          SliverAnimatedList(
            initialItemCount: name.length,
            itemBuilder: (context, index, animation) {
              return LinkShareFastWidget(
                  title: name[index], urlImage: urls[index]);
            },
          )
        ],
      );
  }
}
