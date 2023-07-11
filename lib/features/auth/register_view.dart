// ignore_for_file: use_build_context_synchronously

import 'package:bootcamp_starter/core/widgets/CustomTextTitle.dart';

import 'package:bootcamp_starter/features/auth/widgets/CustomTextFormAuth.dart';
import 'package:bootcamp_starter/features/auth/widgets/textSignUp.dart';
import 'package:bootcamp_starter/features/home/NoConnection.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../Services/validation_password_strong_helper.dart';
import '../../Services/validation_sign.dart';
import '../../core/util/Api static/api_response.dart';

import '../../core/util/constants.dart';
import 'Api usage/Registration/register_provider.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});
  static String id = '/registerView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late ValidationSignProcess validation;

  @override
  void initState() {
    super.initState();

    validation = ValidationSignProcess(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      formKey: _formKey,
    );

    _nameController.addListener(() => validation.name = _nameController.text);
    _emailController
        .addListener(() => validation.email = _emailController.text);
    _passwordController
        .addListener(() => validation.password = _passwordController.text);
    _confirmPasswordController.addListener(
        () => validation.confirmPassword = _confirmPasswordController.text);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

//mhamaddono
//sisi@gmail.com
//sisi1234
  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.aBeeZee(
        color: primaryColor, fontSize: 16, fontWeight: FontWeight.w300);
    final password = Provider.of<ShowStrongPassword>(context);
    return SafeArea(
      child: Scaffold(
        body: OfflineBuilder(
          child: Consumer<SignUpProvider>(
            builder: (context, signUpProvider, child) {
              return signUpProvider.response.status == Status.LOADING
                  ? Center(
                      child: Text(
                        "Wait...",
                        style: style,
                      ),
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
                                //  Image.asset(AssetsData.login),
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
                                  myController: _nameController,
                                  hidepassword: false,
                                  textInputType: TextInputType.emailAddress,
                                  //  myController: provider.emailLoginPage,
                                  validator: (value) =>
                                      validation.validateName()
                                          ? null
                                          : 'Please enter your name',
                                  hintText: '@YousefAljazzar99',
                                  labelText: 'User Name',
                                ),
                                CustomTextFormAuth(
                                  myController: _emailController,

                                  hidepassword: false,
                                  textInputType: TextInputType.emailAddress,
                                  //  myController: provider.emailLoginPage,
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
                                  onChange: (value) =>
                                      password.checkPassword(value, context),
                                  myController: _passwordController,
                                  textInputType: TextInputType.visiblePassword,
                                  hidepassword: true,
                                  validator: (value) =>
                                      validation.validatePassword()
                                          ? null
                                          : 'Please enter a valid password',
                                  hintText: 'password',
                                  labelText: 'password',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: LinearProgressIndicator(
                                    value: password.getStrength,
                                    color: password.getStrength <= 1 / 4
                                        ? Colors.red
                                        : password.getStrength == 2 / 4
                                            ? Colors.yellow
                                            : password.getStrength == 3 / 4
                                                ? Colors.blue
                                                : Colors.green,
                                    minHeight: 3,
                                  ),
                                ),
                                Container(
                                  child: !(password.getStrength == 1)
                                      ? Text(
                                          password.getText,
                                          style: const TextStyle(fontSize: 14),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Great",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green),
                                            ),
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextFormAuth(
                                  myController: _confirmPasswordController,
                                  textInputType: TextInputType.visiblePassword,
                                  hidepassword: true,
                                  validator: (value) =>
                                      validation.validateConfirmPassword()
                                          ? null
                                          : 'Passwords do not match',
                                  hintText: 'password',
                                  labelText: 'password',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomButtonPrimary(
                                  text: 'Create account',
                                  onpressed: () async {
                                    await validation
                                        .validateAndSubmitSignUp(context);
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                CustomTextSignUpOrSignin(
                                  textone: 'Already have an account?',
                                  texttwo: ' sign in',
                                  onTap: () {
                                    //
                                  },
                                ),
                              ],
                            ),
                          ),
                        )),
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
