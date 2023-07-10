import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Active Sharing/user_card.dart';
import '../Home/link_fast.dart';
import '../core/util/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'Facebook',
      "Instagram",
      "WhatsApp",
      'Facebook',
      "Instagram",
      "WhatsApp",
      'Facebook',
      "Instagram",
      "WhatsApp"
    ];
    List<String> urls = [
      "images/facebook.svg",
      "images/insta.svg",
      "images/whatsapp.svg",
      "images/facebook.svg",
      "images/insta.svg",
      "images/whatsapp.svg",
      "images/facebook.svg",
      "images/insta.svg",
      "images/whatsapp.svg"
    ];
    TextStyle style = GoogleFonts.aBeeZee(
        color: Color(0xFFFF1D20), fontSize: 16, fontWeight: FontWeight.w300);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Color(0xFFFF1D20),
                    )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Profile",
                  style: style,
                )
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  margin: EdgeInsets.all(20), child: UserCardWidget()),
            ),
            floating: true,
            pinned: true,
          ),
          SliverAnimatedList(
            initialItemCount: name.length,
            itemBuilder: (context, index, animation) {
              return LinkShareFastWidget(
                  title: name[index], urlImage: urls[index]);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
