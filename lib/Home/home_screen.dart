import 'package:bootcamp_starter/Home/qr_widget.dart';
import 'package:bootcamp_starter/Home/search_scan.dart';

import 'package:flutter/material.dart';

import '../core/util/bottom_nav.dart';
import 'link_fast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Facebook', "Instagram", "WhatsApp"];
    List<String> urls = [
      "images/facebook.svg",
      "images/insta.svg",
      "images/whatsapp.svg"
    ];
    return Scaffold(
      body: CustomScrollView(
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
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
