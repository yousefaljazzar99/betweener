 import '../../../../core/util/Api static/api_base_helper.dart';

class SignInRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await _helper.post("/login", {
      'email': email,
      'password': password,
    });

    if (response == null) {
      throw Exception(
          'An error occurred while signing in. Please try again later.');
    } else {
      return response;
    }
  }
}