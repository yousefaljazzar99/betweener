import 'package:flutter/cupertino.dart';

import '../../core/util/Api static/api_response.dart';
import 'link_repository.dart';
import 'model.dart';

class LinkProvider extends ChangeNotifier {
  late LinkRepository _linkRepository;

  late ApiResponse<List<Links>> _linkList;

  ApiResponse<List<Links>> get linkList => _linkList;

  LinkProvider() {
    _linkRepository = LinkRepository();
    fetchLinkList();
  }

  fetchLinkList() async {
    _linkList = ApiResponse.loading('Fetching Links');

    notifyListeners();
    try {
      List<Links> links = await _linkRepository.fetchLinkList();
      _linkList = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> addLink(Links link) async {
    _linkList = ApiResponse.loading('Adding Link');
    notifyListeners();
    try {
      await _linkRepository.addLink(link);
      _linkList = ApiResponse.completed(null);
      fetchLinkList();
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> updateLink(Links link) async {
    print("-----------------from provider");
    _linkList = ApiResponse.loading('Updating Link');
    notifyListeners();
    try {
      await _linkRepository.updateLink(link);
      await fetchLinkList();
      _linkList = ApiResponse.completed(null);
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> deleteLink(Links links) async {
    _linkList = ApiResponse.loading('Deleting Link');
    notifyListeners();
    try {
      await _linkRepository.deleteLink(links);
      await fetchLinkList();
      notifyListeners();

      _linkList = ApiResponse.completed(null);
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
