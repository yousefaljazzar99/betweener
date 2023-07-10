// ignore_for_file: use_build_context_synchronously

import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/auth/widgets/CustomTextFormAuth.dart';
import 'package:bootcamp_starter/features/auth/widgets/textSignUp.dart';
import 'package:bootcamp_starter/features/home/NoConnection.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  static String id = '/loginView';

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: loginFormKey,
              child: Container(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Image.asset(AssetsData.login),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomTextTitle(
                          text: 'login',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormAuth(
                    
                        hidepassword: false,
                        textInputType: TextInputType.emailAddress,
                        //  myController: provider.emailLoginPage,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'emailEmpty'.tr;
                          }
                          return null;
                        },
                        hintText: 'Enter Your Email', labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormAuth(
                        textInputType: TextInputType.visiblePassword,
                        hidepassword: true,
                        // pressSuffixIcon: () {
                        //   provider.changeShowPasswordLogin();
                        // },
                        validator: (value) {},
                        //   myController: provider.passwordLoginPage,
                        hintText: 'password',

                        // iconData: showPasswordLogin
                        //     ? Icons.visibility
                        //     : Icons.visibility_off,
                        labelText: 'password',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: primaryColor, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButtonPrimary(
                        text: 'Sign In'.tr,
                        onpressed: () async {
                          Navigator.pushNamed(context, MainAppView.id);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextSignUpOrSignin(
                        textone: 'Don\'t have an account?',
                        texttwo: 'Create an account',
                        onTap: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected ? child : NoConnectionScreen();
          },
        ),
      ),
    );
  }
}
