import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/features/search/search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared Preferences/shared_pref.dart';

class SearchScanContainerWidget extends StatelessWidget {
  const SearchScanContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SharedAppPreferences sharedPrefs = SharedAppPreferences();

    return SafeArea(
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
            color: Color(0xFFF6F6F6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
              ),
              radius: 30,
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
                FutureBuilder(
                  future: sharedPrefs.retrieveUserInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.name,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFFF1D20),
                              fontWeight: FontWeight.bold));
                    } else {
                      return Container(
                        width: 80,
                        height: 30,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.1)),
                      );
                    }
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconAssets.scan,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      GestureDetector(
                        onTap: () {
                          showSearch(context: context, delegate: UserSearch());
                        },
                        child: SvgPicture.asset(
                          IconAssets.usersearch,
                          width: 24,
                          height: 25.82,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
