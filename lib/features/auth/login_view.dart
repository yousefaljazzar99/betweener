// ignore_for_file: use_build_context_synchronously

import 'package:bootcamp_starter/animation_route.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';
import 'package:bootcamp_starter/features/auth/Api%20usage/Login/login_provider.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/auth/widgets/CustomTextFormAuth.dart';
import 'package:bootcamp_starter/features/auth/widgets/textSignUp.dart';
import 'package:bootcamp_starter/features/home/NoConnection.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Services/validation_sign.dart';
import '../../core/util/Api static/api_response.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);
  static String id = '/loginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late ValidationSignProcess validation;

  @override
  void initState() {
    super.initState();

    validation = ValidationSignProcess(
      email: _emailController.text,
      password: _passwordController.text,
      formKey: _formKey,
    );

    _emailController
        .addListener(() => validation.email = _emailController.text);
    _passwordController
        .addListener(() => validation.password = _passwordController.text);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OfflineBuilder(
          child: Consumer<SignInProvider>(
            builder: (context, signUpProvider, child) {
              return signUpProvider.response.status == Status.LOADING
                  ? Center(
                      child: Text('wait...'),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: _formKey,
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
                                    myController: _emailController,
                                    hidepassword: false,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) =>
                                        validation.validateEmail()
                                            ? null
                                            : 'Please enter a valid email',
                                    hintText: 'Enter Your Email',
                                    labelText: 'Email',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormAuth(
                                    myController: _passwordController,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    hidepassword: true,
                                    validator: (value) =>
                                        validation.validateEmail()
                                            ? null
                                            : 'Please enter a valid Password',
                                    hintText: 'password',
                                    labelText: 'password',
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomButtonPrimary(
                                    text: 'Sign In'.tr,
                                    onpressed: () async {
                                      await validation
                                          .validateAndSubmitSignIn(context);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  CustomTextSignUpOrSignin(
                                    textone: 'Don\'t have an account?',
                                    texttwo: 'Create an account',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        AnimationBetweenScreen
                                            .goToHomePageRoute(RegisterView()),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            },
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
