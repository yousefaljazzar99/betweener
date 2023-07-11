import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static String id = '/profileView';

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile"),
    );
  }
}
