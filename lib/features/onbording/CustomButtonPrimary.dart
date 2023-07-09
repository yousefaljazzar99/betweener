import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  Color? textColor;
  Color? buttonColor;

  CustomButtonPrimary(
      {super.key,
      required this.text,
      required this.onpressed,
      this.textColor = Colors.white,
      this.buttonColor = primaryColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      // margin:  EdgeInsets.only(top: 10.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          foregroundColor: whiteColor,
          side: const BorderSide(color: primaryColor),
          padding: EdgeInsets.symmetric(vertical: 10),
          primary: buttonColor,
          textStyle: TextStyle(
            fontSize: 16,
          ),
        ),
        onPressed: onpressed,
        child: onpressed == null
            ? Center(
                child: Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: textColor),
                    ),
                    const CircularProgressIndicator()
                  ],
                ),
              )
            : Text(
                text,
                style: TextStyle(color: textColor),
              ),
      ),
    );
  }
}
