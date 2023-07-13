import 'package:bootcamp_starter/features/active_share/user_card.dart';
import 'package:bootcamp_starter/features/profile/Followers/followerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/util/Api static/api_response.dart';
import 'Api Configration/follow_provider.dart';

class FollowingScreen extends StatelessWidget {
  static String id = '/followingScreen';

  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final followProvider = FollowProvider();

    TextStyle style = GoogleFonts.aBeeZee(
        color: Color(0xFFFF1D20), fontSize: 16, fontWeight: FontWeight.w300);
    TextStyle followerStyle = GoogleFonts.aBeeZee(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 150,
            backgroundColor: Colors.white,
            elevation: 0,
            title: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Color(0xFFFF1D20),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Profile",
                      style: style,
                    ),
                  )
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Followers",
                  style: followerStyle,
                ),
              ),
            )),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: followProvider.fetchFollowInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (followProvider.followInfo.status == Status.COMPLETED) {
                    if (followProvider.followInfo.data!.followers.isNotEmpty) {
                      final followingList =
                          followProvider.followInfo.data!.following;
                      return Consumer<FollowProvider>(
                        builder: (context, value, child) {
                          return Container(
                            child: Center(
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: followingList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, FollowerPage.id);
                                        },
                                        child: UserCardWidget());
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('No One Here'),
                      );
                    }
                  } else if (followProvider.followInfo.status == Status.ERROR) {
                    return Center(
                      child:
                          Text('Error: ${followProvider.followInfo.message}'),
                    );
                  } else {
                    return Center(
                      child: Text('Loading...'),
                    );
                  }
                } else {
                  // Show a loading indicator
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(
      //   homeId: HomeView.id,
      //   profileId: ProfileView.id,
      //   activeShareId: ActiveSharingScreen.id,
      // ),
    );
  }
}
