import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Active Sharing',
            style: TextStyle(color: whiteColor),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [Text('هنا بداية النص ')],
        ),
      ),
    );
  }
}
