import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
import 'package:bootcamp_starter/features/onbording/Onbording/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  String text;
  Color textColor;
  Color buttonColor;
  CustomButtonOnBoarding(
      {required this.text, required this.textColor, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return CustomButtonPrimary(
      text: text,
      textColor: textColor,
      buttonColor: buttonColor,
      onpressed: () {
        controller.next(context);
      },
    );
  }
}
