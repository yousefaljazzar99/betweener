// ignore_for_file: use_build_context_synchronously

import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/auth/widgets/CustomTextFormAuth.dart';
import 'package:bootcamp_starter/features/auth/widgets/textSignUp.dart';
import 'package:bootcamp_starter/features/home/NoConnection.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:get/get.dart';

import '../../../main.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static String id = '/registerView';

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //     title: const Text(
        //       "Sign In",
        //       style: TextStyle(color: primaryColor, fontSize: 16),
        //     ),
        //     leading: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back_ios,
        //         color: primaryColor,
        //       ),
        //       //replace with our own icon data.
        //     )),
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: signUpFormKey,
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
                          text: 'Sign Up',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormAuth(
                        hidepassword: false,
                        textInputType: TextInputType.emailAddress,
                        //  myController: provider.emailLoginPage,
                        validator: (value) {},
                        hintText: '@YousefAljazzar99', labelText: 'User Name',
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
                        // labelText: 'كلمة المرور',
                        // iconData: provider.showPasswordLogin
                        //     ? Icons.visibility
                        //     : Icons.visibility_off,
                        labelText: 'password',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButtonPrimary(
                        text: 'Create account',
                        onpressed: () async {},
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextSignUpOrSignin(
                        textone: 'Already have an account?',
                        texttwo: ' sign in',
                        onTap: () {
                          Navigator.pushNamed(context, LoginView.id);
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
