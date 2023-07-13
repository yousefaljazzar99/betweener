import '../../../../core/util/Api static/api_base_helper.dart';
import '../model.dart';

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

  Future<Map<String, dynamic>> updateUser(User user) async {
    final response = await _helper.put(
        "/update/${user.id.toString()}", {"lat": user.lat, "long": user.long});

    if (response == null) {
      throw Exception(
          'An error occurred while updating the user. Please try again later.');
    } else {
      return response;
    }
  }

  Future<Map<String, dynamic>> getUser(User user) async {
    final response = await _helper.put("/users/${user.id.toString()}", {});

    if (response == null) {
      throw Exception(
          'An error occurred while updating the user. Please try again later.');
    } else {
      return response;
    }
  }
}
