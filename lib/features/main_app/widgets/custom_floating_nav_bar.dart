import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFloatingNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomFloatingNavBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        backgroundColor: whiteColor,
        selectedItemColor: primaryColor,
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedItemColor: buttomButtonsIconColor,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconAssets.activeSharing,
              color: currentIndex == 0 ? primaryColor : buttomButtonsIconColor,
            ),
            label: 'Active Sharing',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconAssets.home,
              color: currentIndex == 1 ? primaryColor : buttomButtonsIconColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconAssets.profile,
              color: currentIndex == 2 ? primaryColor : buttomButtonsIconColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
