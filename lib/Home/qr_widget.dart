import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.aBeeZee(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "images/qr.svg",
          width: 250,
          height: 250,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Scan the QR code",
          style: style,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "To be able to open my profile",
          style: style,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
          height: 1.5,
          color: Colors.black,
        )
      ],
    );
  }
}
