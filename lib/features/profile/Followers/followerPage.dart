import 'package:bootcamp_starter/features/home/link_fast.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/features/active_share/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowerPage extends StatelessWidget {
  static String id = '/followerPage';

  const FollowerPage({super.key});

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
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp,
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp,
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp,
    ];
    TextStyle style = GoogleFonts.aBeeZee(
        color: Color(0xFFFF1D20), fontSize: 16, fontWeight: FontWeight.w300);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
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
                      "Followers",
                      style: style,
                    ),
                  )
                ],
              ),
            ),
            expandedHeight: 200,
            backgroundColor: Colors.white,
            elevation: 0,
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
    );
  }
}
