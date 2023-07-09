import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;

  CustomTextTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //    width: 150,
      child: Text(text,
          textAlign: TextAlign.start,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
