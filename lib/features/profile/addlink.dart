import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/features/auth/widgets/CustomTextFormAuth.dart';
import 'package:bootcamp_starter/features/onbording/CustomButtonPrimary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/util/assets.dart';

class AddLink extends StatelessWidget {
  const AddLink({super.key});
  static String id = '/addLink';

  @override
  Widget build(BuildContext context) {
    final TextEditingController TitleController = TextEditingController();
    final TextEditingController linkController = TextEditingController();
 
    TextStyle style = GoogleFonts.aBeeZee(
        color: Color(0xFFFF1D20), fontSize: 16, fontWeight: FontWeight.w300);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: linkBorderColor,
                    child: SvgPicture.asset(IconAssets.facebook),
                    // backgroundImage: NetworkImage(
                    //   'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                    // ),
                    radius: 60,
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.height * 0.11,
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormAuth(
              myController: TitleController,

              hidepassword: false,
              textInputType: TextInputType.emailAddress,
              //  myController: provider.emailLoginPage,
              validator: (value) {},

              hintText: 'FaceBook', labelText: 'Title',
            ),
            CustomTextFormAuth(
              myController: linkController,

              hidepassword: false,
              textInputType: TextInputType.emailAddress,
              //  myController: provider.emailLoginPage,
              validator: (value) {},

              hintText: 'www.facebook.com/joseph.n.j99', labelText: 'The Link',
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            CustomButtonPrimary(text: "Add Link", onpressed: () {})
          ],
        ),
      ),
    );
  }
}
