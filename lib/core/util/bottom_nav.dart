import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.aBeeZee(color: const Color(0xFFFF1D20));
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
            activeColor: Color(0xFFFF1D20),
            backgroundColor: Colors.white,
            tabBackgroundColor: Color(0xFFFF1D20).withOpacity(0.15),
            color: Color(0xFFBDBDBD),
            padding: EdgeInsets.all(4),
            gap: 8,
            tabs: [
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.person_pin,
                iconSize: 25,
                text: "Profile",
                textStyle: style,
                onPressed: () {},
              ),
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.home,
                iconSize: 25,
                textStyle: style,
                text: "Home",
              ),
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.share_location,
                iconSize: 25,
                text: "Active Sharing",
                textStyle: style,
              )
            ]),
      ),
    );
  }
}
