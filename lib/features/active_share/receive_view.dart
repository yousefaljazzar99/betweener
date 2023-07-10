import 'package:bootcamp_starter/features/active_share/user_card.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiveView extends StatelessWidget {
  const ReceiveView({Key? key}) : super(key: key);
  static String id = '/receiveView';

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
                    AssetsData.active_share,
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
    );
  }
}
