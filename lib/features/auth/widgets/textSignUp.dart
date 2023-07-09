import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const CustomTextSignUpOrSignin(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
                color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
