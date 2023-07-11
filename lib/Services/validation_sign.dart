import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Shared Preferences/token_shared_pref.dart';

import '../core/util/Api static/api_response.dart';
import '../features/auth/Api usage/Login/login_provider.dart';
import '../features/auth/Api usage/Registration/register_provider.dart';
import '../features/auth/Api usage/model.dart';

class ValidationSignProcess {
  String? name;
  String email;
  String password;
  String? confirmPassword;
  GlobalKey<FormState> formKey;

  ValidationSignProcess(
      {this.name,
      required this.email,
      required this.password,
      this.confirmPassword,
      required this.formKey});
  validateAndSubmitSignUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      SignUpProvider signUpProvider =
          Provider.of<SignUpProvider>(context, listen: false);
      await signUpProvider.signUp(name!, email, password, confirmPassword!);
      if (signUpProvider.response.status == Status.COMPLETED) {
        Navigator.pushNamed(context, LoginView.id);
      }
    }
  }

  validateAndSubmitSignIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      SignInProvider signInProvider =
          Provider.of<SignInProvider>(context, listen: false);
      await signInProvider.signIn(email, password);
      if (signInProvider.response.status == Status.COMPLETED) {
        String? token = signInProvider.token;
        Map<String, dynamic> responseData = signInProvider.response.data!;
        Map<String, dynamic> userInfo = responseData['user'];
        if (token != null) {
          SharedAppPreferences sharedPrefs = SharedAppPreferences();
          await sharedPrefs.storeToken(token);
          await sharedPrefs.storeUserInfo(User.fromJson(userInfo));
        }
        Navigator.pushNamed(context, HomeView.id);
      }
    }
  }

  bool validateName() {
    if (name!.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateEmail() {
    if (email.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (password.isEmpty || password.length < 8) {
      return false;
    }
    return true;
  }

  bool validateConfirmPassword() {
    if (confirmPassword!.isEmpty || confirmPassword != password) {
      return false;
    }
    return true;
  }
}
