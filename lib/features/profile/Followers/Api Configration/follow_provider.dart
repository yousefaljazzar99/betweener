import 'package:bootcamp_starter/features/auth/Api%20usage/model.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/util/Api static/api_response.dart';
import 'follow_repository.dart';
import 'model.dart';

class FollowProvider extends ChangeNotifier {
  late FollowRepository _followRepository;
  late ApiResponse<Follow> _followInfo;

  ApiResponse<Follow> get followInfo => _followInfo;

  FollowProvider() {
    _followRepository = FollowRepository();
    fetchFollowInfo();
  }

  fetchFollowInfo() async {
    _followInfo = ApiResponse.loading('Fetching Follow Info');
    notifyListeners();
    try {
      Follow follow = await _followRepository.fetchFollowInfo();
      _followInfo = ApiResponse.completed(follow);
      notifyListeners();
    } catch (e) {
      _followInfo = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> addFollow(User userId) async {
    _followInfo = ApiResponse.loading('Adding Follow');
    notifyListeners();
    try {
      await _followRepository.addFollow(userId);
      _followInfo = ApiResponse.completed(null);
      fetchFollowInfo();
    } catch (e) {
      _followInfo = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
