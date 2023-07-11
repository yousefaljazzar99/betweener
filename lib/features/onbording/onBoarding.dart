// ignore_for_file: file_names

import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/home/NoConnection.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';

import 'package:bootcamp_starter/features/onbording/Onbording/cutomslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../animation_route.dart';
import 'Onbording/customButtonWidget.dart';

class OnBoarding extends StatelessWidget {
  static String id = '/onBoarding';

  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OfflineBuilder(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      //     const CustomDotControllerOnBoarding(),
                      SizedBox(
                        height: 16,
                      ),
                      CustomButtonOnBoarding(
                        textColor: whiteColor,
                        buttonColor: primaryColor,
                        text: 'Next',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButtonPrimary(
                        onpressed: () {
                          Navigator.push(
                            context,
                            AnimationBetweenScreen.goToHomePageRoute(
                                LoginView()),
                          );
                        },
                        textColor: primaryColor,
                        buttonColor: whiteColor,
                        text: 'Skip',
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        return connected ? child : NoConnectionScreen();
      },
    ));
  }
}
