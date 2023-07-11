import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/home/link_fast.dart';

import 'package:bootcamp_starter/features/profile/Followers/followers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shared Preferences/shared_pref.dart';
import '../../core/util/assets.dart';

class ProfileView extends StatelessWidget {
  static String id = '/profileView';

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Facebook', "Instagram", "WhatsApp"];
    List<String> urls = [
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp
    ];
    SharedAppPreferences sharedPrefs = SharedAppPreferences();
    TextStyle style = GoogleFonts.aBeeZee(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    color: Color(0xFFF6F6F6)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
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
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1)),
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
                                  SvgPicture.asset(
                                    IconAssets.usersearch,
                                    width: 24,
                                    height: 25.82,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, FollowerScreen.id);
                          },
                          color: primaryColor,
                          child: Text(
                            'Followers',
                            style: style,
                          ),
                          minWidth: 100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, FollowerScreen.id);
                          },
                          color: primaryColor,
                          child: Text(
                            'Following',
                            style: style,
                          ),
                          minWidth: 100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu),
                  LinkShareFastWidget(title: name[0], urlImage: urls[0]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu),
                  LinkShareFastWidget(title: name[1], urlImage: urls[1]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu),
                  LinkShareFastWidget(title: name[2], urlImage: urls[2]),
                ],
              ),
              Spacer(),
              MaterialButton(
                onPressed: () async {
                  SharedAppPreferences sharedPrefs =
                      context.read<SharedAppPreferences>();

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove("token");
                  print(sharedPrefs.retrieveToken());
                  Navigator.pushNamed(context, LoginView.id);
                },
                color: primaryColor,
                child: Text(
                  'Sign Out',
                  style: style,
                ),
                minWidth: 300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
