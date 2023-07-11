import 'package:bootcamp_starter/features/auth/Api%20usage/Registration/register_repo.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/util/Api static/api_response.dart';
 

class SignUpProvider extends ChangeNotifier {
  late SignUpRepository _signUpRepository;

  ApiResponse<Map<String, dynamic>> _response;
  String? _token;

  ApiResponse<Map<String, dynamic>> get response => _response;
  String? get token => _token;

  SignUpProvider() : _response = ApiResponse.error('Not signed up yet') {
    _signUpRepository = SignUpRepository();
  }

  signUp(String name, String email, String password,
      String password_confirmation) async {
    _response = ApiResponse.loading('Signing Up');
    notifyListeners();
    try {
      // Send the sign-up request and get the response
      var response = await _signUpRepository.signUp(
          name, email, password, password_confirmation);

      // Extract the token from the response
      _token = response['token'];

      // Update the state with the new response
      _response = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      print(e);
      _response = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
