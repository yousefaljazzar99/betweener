import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
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
              child: SvgPicture.asset(AssetsData.warning),
            )),
            SizedBox(
              height: 20,
            ),
            CustomTextTitle(text: 'There is a problem'),
            SizedBox(
              height: 20,
            ),
            Text(
              '''Unfortunately, you may not be able to connect to the Internet.
Please check please.''',
              textAlign: TextAlign.center,
              style: TextStyle(color: profileCardBackground),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButtonPrimary(text: 'Try Again', onpressed: () {})
          ],
        ),
      ),
    );
  }
}
