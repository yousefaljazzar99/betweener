import 'package:bootcamp_starter/features/search/search_repo.dart';
import 'package:flutter/foundation.dart';

import '../../core/util/Api static/api_response.dart';
import '../auth/Api usage/model.dart';

class UserProvider extends ChangeNotifier {
  late UserRepository _userRepository;
  late ApiResponse<List<User>> _userList;

  ApiResponse<List<User>> get userList => _userList;

  UserProvider() {
    _userRepository = UserRepository();
    _userList = ApiResponse.loading('Search for users');
  }

  searchUsers(String name) async {
    _userList = await ApiResponse.loading('Searching for users');
    notifyListeners();
    try {
      List<User> users = await _userRepository.searchUsers(name);
      _userList = ApiResponse.completed(users);
      notifyListeners();
    } catch (e) {
      _userList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
