import '../../../../Shared Preferences/shared_pref.dart';
import '../../../../core/util/Api static/api_base_helper.dart';

import '../../../auth/Api usage/model.dart';
import 'model.dart';

class FollowRepository {
  SharedAppPreferences sharedPrefs = SharedAppPreferences();
  ApiBaseHelper _helper =
      ApiBaseHelper(token: "800|1H3zNF677uOoc0AfP9Cu3gocQvmOFy1t7LDRbI9C");

  // Future<void> _init() async {
  //   String? token = await sharedPrefs.retrieveToken();
  //   _helper = ApiBaseHelper(token: token);
  // }

  Future<Follow> fetchFollowInfo() async {
    final response = await _helper.getWithToken("/follow");
    return Follow.fromJson(response);
  }

  Future<void> addFollow(User userId) async {
    await _helper.post("/follow", {'user_id': userId.id.toString()});
  }
}
