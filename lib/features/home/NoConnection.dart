import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoConnectionScreen extends StatelessWidget {
  NoConnectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(AssetsData.onBoardingImage),
            )),
            SizedBox(
              height: 20,
            ),
            CustomTextTitle(text: 'problem'),
            SizedBox(
              height: 20,
            ),
            Text(
              "noInternet",
              textAlign: TextAlign.center,
              style: TextStyle(color: linkBorderColor),
            ),
          ],
        ),
      ),
    );
  }
}
