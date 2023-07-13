import 'package:bootcamp_starter/features/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/Api static/api_response.dart';

class UserSearch extends SearchDelegate {
  static String id = '/searchView';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return returnBulder(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return returnBulder(context);
  }

  returnBulder(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final userList = userProvider.userList;
        if (userList.status == Status.LOADING) {
          return Center(child: CircularProgressIndicator());
        } else if (userList.status == Status.COMPLETED) {
          return ListView.builder(
            itemCount: userList.data!.length,
            itemBuilder: (context, index) {
              final user = userList.data![index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        } else if (userList.status == Status.ERROR) {
          return Center(child: Text(userList.message!));
        } else {
          return Container();
        }
      },
    );
  }
}
