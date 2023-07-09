import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/home/NoConnection.dart';
import 'package:bootcamp_starter/features/onbording/onBoarding.dart';
import 'package:bootcamp_starter/splash_page/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String login = "/login";
  static const String noConnection = "/no-connection";
  static const String onBoarding = "/onBoarding";

  static String getSplashScreen() => splashScreen;
  static String getInitial() => initial;
  static String getLogin() => login;
  static String getNoConnection() => noConnection;
  static String getOnBoarding() => onBoarding;

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () {
          return const SplashScreen();
        }),
    GetPage(
      name: login,
      page: () {
        return LoginView();
      },
    ),
    GetPage(
      name: onBoarding,
      page: () {
        return const OnBoarding();
      },
    ),
    GetPage(
      name: noConnection,
      page: () {
        return NoConnectionScreen();
      },
    ),
  ];
}
