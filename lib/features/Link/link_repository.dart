import '../../Shared Preferences/shared_pref.dart';
import '../../core/util/Api static/api_base_helper.dart';
import 'model.dart';

class LinkRepository {
  SharedAppPreferences sharedPrefs = SharedAppPreferences();

  ApiBaseHelper _helper =
      ApiBaseHelper(token: "49|yFL94U4aHA3HArs0PtUwqsYwHNs00DbnmyeYXOlb");

  // LinkRepository() {
  //   _init();
  // }

  Future<void> _init() async {
    String? token = await sharedPrefs.retrieveToken();
    _helper = await ApiBaseHelper(
        token: "766|6biSYbEvegVS3icVZvS4or1n0BHPXNLg6dJHoYhV");
  }

  Future<List<Links>> fetchLinkList() async {
    final response = await _helper.getWithToken("/links");
    return LinkResponse.fromJson(response).results;
  }

  Future<List<Links>> addLink(Links links) async {
    final response = await _helper.post("/links", {
      'title': links.title,
      'link': links.link,
      'username': links.username,
    });
    return LinkResponse.fromJson(response).results;
  }

  Future<List<Links>> updateLink(Links links) async {
    print("-----------------from 1repo");

    final response = await _helper.put("/links/${links.id}",
        {'title': links.title, "link": links.link, "username": links.username});
    print("-----------------from 2repo");

    return LinkResponse.fromJson(response).results;
  }

  Future<void> deleteLink(Links links) async {
    await _helper.delete("/links/${links.id}");
  }
}
