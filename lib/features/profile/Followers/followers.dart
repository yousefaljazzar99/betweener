import 'dart:math';

import 'package:bootcamp_starter/features/active_share/user_card.dart';
import 'package:bootcamp_starter/features/profile/Followers/followerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowerScreen extends StatelessWidget {
  static String id = '/followerScreen';

  const FollowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.aBeeZee(
        color: Color(0xFFFF1D20), fontSize: 16, fontWeight: FontWeight.w300);
    TextStyle followerStyle = GoogleFonts.aBeeZee(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 150,
            backgroundColor: Colors.white,
            elevation: 0,
            title: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Color(0xFFFF1D20),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Profile",
                      style: style,
                    ),
                  )
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Followers",
                  style: followerStyle,
                ),
              ),
            )),
            floating: true,
            pinned: true,
          ),
          SliverAnimatedList(
            initialItemCount: 10,
            itemBuilder: (context, index, animation) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FollowerPage.id);
                  },
                  child: UserCardWidget());
            },
          )
        ],
      ),
    );
  }
}
