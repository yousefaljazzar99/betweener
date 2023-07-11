import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';

import '../../Shared Preferences/token_shared_pref.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.aBeeZee(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.qrcode, width: 250, height: 250),
        // SvgPicture.asset(

        //   // width: 250,
        //   // height: 250,
        // ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () async {
            // Create a SharedAppPreferences object
            SharedAppPreferences sharedPrefs = SharedAppPreferences();

            // Retrieve the token from SharedPreferences using the retrieveToken method of SharedAppPreferences
            String? token = await sharedPrefs.retrieveToken();

            // Check if the token is not null
            if (token != null) {
              // The token was successfully retrieved, so you can print it
              print(token);
            } else {
              // The token was not found in SharedPreferences
              print('Token not found');
            }
          },
          child: Text(
            "Scan the QR code",
            style: style,
          ),
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
