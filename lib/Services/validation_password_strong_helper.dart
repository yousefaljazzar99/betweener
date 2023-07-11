import 'package:flutter/cupertino.dart';

class ShowStrongPassword extends ChangeNotifier {
  late String _password;
  double _strength = 0;
  double get getStrength => _strength;

  String _displayText = '';
  String get getText => _displayText;
  updateStrength(double strength, String text) {
    _displayText = text;
    _strength = strength;
    notifyListeners();
  }

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  checkPassword(String value, BuildContext context) {
    _password = value.trim();

    if (_password.isEmpty) {
      updateStrength(0, '');
      return false;
    } else if (_password.length < 6) {
      updateStrength(1 / 4, "Short");
      return false;
    } else if (_password.length < 8) {
      updateStrength(2 / 4, "Still Short");
      return true;
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        updateStrength(3 / 4, "Strong");
        return true;
      } else {
        updateStrength(1, '');
        return true;
      }
    }
  }
}
