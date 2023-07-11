import 'dart:async';

import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';

import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/onBoarding.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Shared Preferences/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  static String id = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadResource();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
      const Duration(seconds: 3),
      () async {
        SharedAppPreferences sharedPrefs = context.read<SharedAppPreferences>();

        if (await sharedPrefs.retrieveToken() == null) {
          Navigator.pushNamed(context, OnBoarding.id);
        } else {
          Navigator.pushNamed(context, MainAppView.id);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
                child: SizedBox(
                    width: 266,
                    height: 280,
                    child: Image.asset(AssetsData.logo))),
          ),
        ],
      ),
    );
  }
}
