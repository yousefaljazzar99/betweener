import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LinkShareFastWidget extends StatelessWidget {
  const LinkShareFastWidget(
      {super.key, required this.title, required this.urlImage});
  final String title;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 36),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE3E3E3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  urlImage,
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.copy))
        ],
      ),
    );
  }
}
