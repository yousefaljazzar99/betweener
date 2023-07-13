import 'package:bootcamp_starter/Active%20Sharing/active_sharing.dart';
import 'package:bootcamp_starter/Services/validation_password_strong_helper.dart';
import 'package:bootcamp_starter/Shared%20Preferences/shared_pref.dart';

import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/onBoarding.dart';
import 'package:bootcamp_starter/features/onbording/onbording_view.dart';
import 'package:bootcamp_starter/features/profile/Edit%20Profile/edit_profile.dart';
import 'package:bootcamp_starter/features/profile/Followers/Api%20Configration/follow_provider.dart';
import 'package:bootcamp_starter/features/profile/Followers/followerPage.dart';
import 'package:bootcamp_starter/features/profile/Followers/followers.dart';
import 'package:bootcamp_starter/features/profile/Followers/following.dart';
import 'package:bootcamp_starter/features/profile/addlink.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:bootcamp_starter/features/search/search.dart';
import 'package:bootcamp_starter/features/search/search_provider.dart';
import 'package:bootcamp_starter/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'Shared Preferences/shared_pref.dart';


import 'core/util/constants.dart';

import 'features/Link/link_provider.dart';
import 'features/auth/Api usage/Login/login_provider.dart';
import 'features/auth/Api usage/Registration/register_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShowStrongPassword(),
        ),
        ChangeNotifierProvider(
          create: (context) => LinkProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FollowProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        Provider<SharedAppPreferences>(create: (_) => SharedAppPreferences()),
      ],
      child: MaterialApp(
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
        home: SplashScreen(),
        routes: {
          OnBoarding.id: (context) => const OnBoarding(),
          OnBoardingView.id: (context) => const OnBoardingView(),
          LoginView.id: (context) => LoginView(),
          RegisterView.id: (context) => RegisterView(),
          HomeView.id: (context) => const HomeView(),
          MainAppView.id: (context) => const MainAppView(),
          ProfileView.id: (context) => const ProfileView(),
          ActiveSharingScreen.id: (context) => const ActiveSharingScreen(),
          SplashScreen.id: (context) => const SplashScreen(),
          FollowerScreen.id: (context) => const FollowerScreen(),
          FollowerPage.id: (context) => const FollowerPage(),
          EditProfile.id: (context) => const EditProfile(),
          AddLink.id: (context) => const AddLink(),
          FollowingScreen.id: (context) => const FollowingScreen(),
        },
      ),
    );
  }
}
