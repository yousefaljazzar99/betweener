import 'package:bootcamp_starter/Active%20Sharing/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/util/bottom_nav.dart';

class ActiveSharingScreen extends StatelessWidget {
  const ActiveSharingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 112),
                      child: Text("Active Sharing",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w300))),
                  Container(
                    margin: const EdgeInsets.only(bottom: 90, top: 48),
                    child: SvgPicture.asset(
                      "images/active_share.svg",
                      width: 120,
                      height: 193,
                    ),
                  ),
                ],
              ),
            ),
            SliverAnimatedList(
              initialItemCount: 10,
              itemBuilder: (context, index, animation) {
                return const UserCardWidget();
              },
            )
          ],
        ),
        bottomNavigationBar: const BottomNavigationBarWidget());
  }
}
