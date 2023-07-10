import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/features/profile/Edit%20Profile/edit_profile.dart';
import 'package:bootcamp_starter/features/profile/Followers/followers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/util/constants.dart';
import '../main_app/main_app_view.dart';
import '../onbording/CustomButtonPrimary.dart';

class ProfileView extends StatelessWidget {
  static String id = '/profileView';

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: profileCardBackground,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24))),
                    color: profileCardBackground,
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            margin: EdgeInsets.only(top: 15, left: 15),
                            child: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                              ),
                              radius: 30,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 88, top: 24),
                            child: Text(
                              'Yousef Aljazzar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 90, top: 49),
                            child: Text(
                              '@YousefAljazzar99',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 80, left: 95, bottom: 25),
                            child: Text(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                                'C.S Engineer 🎓, @alazharug\n.Software Engineer, Flutter Mobile Developer\nand UI Designer\nlinktr.ee/yousefaljazzar'),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                FollowerScreen.id,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 232, top: 34, right: 25),
                              child: Text(
                                '963',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 217.5, top: 54, right: 25),
                            child: Text(
                              'followers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 300, top: 34, right: 25),
                            child: Text(
                              '963',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 290.5, top: 54, right: 25),
                            child: Text(
                              'followers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 55),
                        width: 24,
                        height: 13,
                        child: SvgPicture.asset(IconAssets.menu),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(left: 26),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.only(left: 15, top: 50),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(IconAssets.facebook),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 29, right: 165),
                              child: Text(
                                'Facebook '
                                '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 30),
                        width: 24,
                        height: 13,
                        child: SvgPicture.asset(IconAssets.menu),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(left: 26),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.only(left: 15, top: 30),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                IconAssets.insta,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 29, right: 165),
                              child: Text(
                                'instagram',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 30),
                        width: 24,
                        height: 13,
                        child: SvgPicture.asset(
                          IconAssets.menu,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(left: 26),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.only(left: 15, top: 30),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(IconAssets.whatsapp),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 29, right: 165),
                              child: Text(
                                'whattsapp',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 11, left: 20, bottom: 13),
                    margin: EdgeInsets.only(top: 21, left: 6, right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: SvgPicture.asset(IconAssets.facebook),
                          margin: EdgeInsets.only(right: 50),
                        ),
                        Container(
                            padding: EdgeInsets.only(),
                            child: Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                          width: 110,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: editLinkIconColor,
                    width: 48,
                    margin: EdgeInsets.only(top: 22),
                    height: 44,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(IconAssets.del),
                    ),
                  ),
                  Container(
                    color: deleteLinkIconColor,
                    width: 48,
                    margin: EdgeInsets.only(top: 22),
                    height: 44,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(IconAssets.edit),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: CustomButtonPrimary(
                  text: 'Add Link'.tr,
                  onpressed: () async {
                    // Navigator.pushNamed(context, MainAppView.id);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: CustomButtonPrimary(
                  onpressed: () {
                    // Navigator.pushNamed(context, LoginView.id);
                    Navigator.pushNamed(context, EditProfile.id);
                  },
                  textColor: primaryColor,
                  buttonColor: whiteColor,
                  text: 'Edit Profile',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:bootcamp_starter/features/home/link_fast.dart';
// import 'package:bootcamp_starter/core/util/assets.dart';
// import 'package:bootcamp_starter/features/active_share/user_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProfileView extends StatelessWidget {
//   static String id = '/profileView';

//   const ProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> name = [
//       'Facebook',
//       "Instagram",
//       "WhatsApp",
//       'Facebook',
//       "Instagram",
//       "WhatsApp",
//       'Facebook',
//       "Instagram",
//       "WhatsApp"
//     ];
//     List<String> urls = [
//       IconAssets.facebook,
//       IconAssets.insta,
//       IconAssets.whatsapp,
//       IconAssets.facebook,
//       IconAssets.insta,
//       IconAssets.whatsapp,
//       IconAssets.facebook,
//       IconAssets.insta,
//       IconAssets.whatsapp,
//     ];
//     TextStyle style = GoogleFonts.aBeeZee(
//         color: Color(0xFFFF1D20), fontSize: 16, fontWeight: FontWeight.w300);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200,
//             backgroundColor: Colors.white,
//             elevation: 0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                   margin: EdgeInsets.all(20), child: UserCardWidget()),
//             ),
//             floating: true,
//             pinned: true,
//           ),
//           SliverAnimatedList(
//             initialItemCount: name.length,
//             itemBuilder: (context, index, animation) {
//               return LinkShareFastWidget(
//                   title: name[index], urlImage: urls[index]);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
