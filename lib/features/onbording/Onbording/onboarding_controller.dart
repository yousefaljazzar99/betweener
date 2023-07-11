 
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/onbording/static.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  void next(BuildContext context); // Pass the context as a parameter
  void onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  @override
  void next(BuildContext context) {
    // Receive the context as a parameter
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Navigator.pushNamed(context, LoginView.id); // Use the passed context
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
