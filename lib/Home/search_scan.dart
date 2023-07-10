import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScanContainerWidget extends StatelessWidget {
  const SearchScanContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)),
          color: Color(0xFFF6F6F6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
            ),
            radius: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Evening',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Muhammad Hamad',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF1D20),
                      fontWeight: FontWeight.bold))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "images/scan.svg",
                      width: 24,
                      height: 24,
                      color: Color(0xFFFF1D20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "images/usersearch.svg",
                      width: 24,
                      height: 25.82,
                      color: Color(0xFF292D32),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
