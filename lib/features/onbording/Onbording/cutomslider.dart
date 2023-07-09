import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';
import 'package:bootcamp_starter/features/onbording/Onbording/onboarding_controller.dart';
import 'package:bootcamp_starter/features/onbording/static.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return PageView.builder(
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        controller: controller.pageController,
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  onBoardingList[i].image ?? '',
                  width: 250,
                  height: 250,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextTitle(
                  text: onBoardingList[i].title ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(onBoardingList[i].body ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: buttomButtonsIconColor))),
              ],
            ));
  }
}
