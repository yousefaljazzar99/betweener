import 'package:flutter/cupertino.dart';

import '../../../../core/util/Api static/api_response.dart';
import 'login_repo.dart';

class SignInProvider extends ChangeNotifier {
  late SignInRepository _signInRepository;

  ApiResponse<Map<String, dynamic>> _response;
  String? _token;

  ApiResponse<Map<String, dynamic>> get response => _response;
  String? get token => _token;

  SignInProvider() : _response = ApiResponse.error('Not signed in yet') {
    _signInRepository = SignInRepository();
  }

  signIn(String email, String password) async {
    _response = ApiResponse.loading('Signing In');
    notifyListeners();
    try {
      var response = await _signInRepository.signIn(email, password);
      _token = response['token'];
      _response = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      print(e);
      _response = ApiResponse.error(e.toString());
      notifyListeners();
    }

    return response.data;
  }
}
