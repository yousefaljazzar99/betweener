import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/home/link_fast.dart';

import 'package:bootcamp_starter/features/profile/Followers/followers.dart';
import 'package:bootcamp_starter/features/profile/Followers/following.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shared Preferences/shared_pref.dart';
import '../../core/util/Api static/api_response.dart';
import '../../core/util/assets.dart';
import '../../input_updated_link.dart';
import '../Link/link_provider.dart';
import '../Link/model.dart';

class ProfileView extends StatefulWidget {
  static String id = '/profileView';

  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController linkEditingController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    usernameEditingController.dispose();
    linkEditingController.dispose();
    titleEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Facebook', "Instagram", "WhatsApp"];
    List<String> urls = [
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp
    ];
    final linkProvider = LinkProvider();
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
                            Navigator.pushNamed(context, FollowingScreen.id);
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
              Container(
                height: 300,
                child: FutureBuilder(
                  future: linkProvider.fetchLinkList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final linkList = linkProvider.linkList;
                      if (linkList.status == Status.COMPLETED) {
                        final links = linkList.data!;
                        if (links.isNotEmpty) {
                          return Consumer<LinkProvider>(
                            builder: (context, value, child) {
                              return Container(
                                child: Center(
                                  child: Expanded(
                                    child: ListView.builder(
                                      itemCount: links.length,
                                      itemBuilder: (context, index) {
                                        return LinkShareFastWidget(
                                          title: links[index].title,
                                          urlImage: IconAssets.facebook,
                                          iconButtonCopy: IconButton(
                                              onPressed: () async {
                                                Clipboard.setData(ClipboardData(
                                                    text: links[index].link));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'Copied to clipboard')),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.copy,
                                                size: 15,
                                              )),
                                          iconButtonEdit: IconButton(
                                              onPressed: () async {
                                                UpdateLink()
                                                    .openAnimatedUpdateDialog(
                                                        context,
                                                        "Edit",
                                                        "Update Link",
                                                        usernameEditingController,
                                                        linkEditingController,
                                                        titleEditingController,
                                                        links[index], () async {
                                                  Links link = links[index];
                                                  link.title =
                                                      titleEditingController
                                                          .text;
                                                  link.username =
                                                      usernameEditingController
                                                          .text;
                                                  link.link =
                                                      linkEditingController
                                                          .text;

                                                  await value
                                                      .updateLink(Links(
                                                          id: link.id,
                                                          title: link.title,
                                                          link: link.link,
                                                          username:
                                                              link.username))
                                                      .whenComplete(
                                                    () {
                                                      Navigator.of(context)
                                                          .pop();

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                            content:
                                                                Text('Edited')),
                                                      );
                                                    },
                                                  );
                                                });
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                size: 15,
                                              )),
                                          iconButtonDelete: IconButton(
                                              onPressed: () async {
                                                UpdateLink()
                                                    .openAnimatedDeleteDialog(
                                                        context,
                                                        'Delete',
                                                        "Are u sure?",
                                                        () async {
                                                  await value
                                                      .deleteLink(links[index])
                                                      .whenComplete(() {
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content:
                                                              Text('Deleted')),
                                                    );
                                                  });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                size: 15,
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(
                            child: Text('No links found'),
                          );
                        }
                      } else if (linkList.status == Status.ERROR) {
                        return Container(
                          child: Text('Error: ${linkList.message}'),
                        );
                      } else {
                        return Container(
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
              Spacer(),
              MaterialButton(
                onPressed: () async {
                  SharedAppPreferences sharedPrefs =
                      context.read<SharedAppPreferences>();
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove("token");
                  await prefs.remove("user_info");
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
