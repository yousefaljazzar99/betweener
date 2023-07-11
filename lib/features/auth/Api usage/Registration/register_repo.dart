import '../../../../core/util/Api static/api_base_helper.dart';

class SignUpRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Map<String, dynamic>> signUp(String name, String email,
      String password, String passwordConfirmation) async {
    final response = await _helper.post("/register", {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    if (response == null) {
      throw Exception(
          'An error occurred while signing up. Please try again later.');
    } else {
      return response;
    }
  }
}
