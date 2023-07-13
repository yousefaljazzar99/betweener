import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LinkShareFastWidget extends StatelessWidget {
  const LinkShareFastWidget(
      {super.key,
      required this.title,
      required this.urlImage,
      this.iconButtonCopy,
      this.iconButtonDelete,
      this.iconButtonEdit});
  final String title;
  final String urlImage;
  final IconButton? iconButtonEdit;
  final IconButton? iconButtonDelete;
  final IconButton? iconButtonCopy;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
          Row(
            children: [
              iconButtonCopy ?? Container(),
              iconButtonDelete ?? Container(),
              iconButtonEdit ?? Container(),
            ],
          )
        ],
      ),
    );
  }
}
