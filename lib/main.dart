import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/onBoarding.dart';
import 'package:bootcamp_starter/features/onbording/onbording_view.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:bootcamp_starter/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/util/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          scaffoldBackgroundColor: kScaffoldColor),
      home: const SplashScreen(),
      routes: {
        OnBoarding.id: (context) => const OnBoarding(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        HomeView.id: (context) => const HomeView(),
        MainAppView.id: (context) => const MainAppView(),
        ProfileView.id: (context) => const ProfileView(),
        ReceiveView.id: (context) => const ReceiveView(),
        SplashScreen.id: (context) => const SplashScreen(),
      },
    );
  }
}
