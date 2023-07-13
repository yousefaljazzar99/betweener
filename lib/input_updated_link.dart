import 'package:bootcamp_starter/features/auth/widgets/CustomTextFormAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_form.dart';
import 'features/Link/model.dart';

class UpdateLink {
  void openAnimatedUpdateDialog(
    BuildContext context,
    String title,
    String content,
    TextEditingController updateUserName,
    TextEditingController updateLink,
    TextEditingController updateTitle,
    Links link,
    void Function()? save,
  ) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        updateUserName.text = link.username;
        updateLink.text = link.link;
        updateTitle.text = link.title;
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: AlertDialog(
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xff4B45BD)))),
                    child: Text(title),
                  ),
                  content: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        CostumTextFormFields(
                          controller: updateTitle,
                        ),
                        CostumTextFormFields(
                          controller: updateUserName,
                        ),
                        CostumTextFormFields(
                          controller: updateLink,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: save,
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xff4B45BD).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Save",
                            style: TextStyle(color: Color(0xff4B45BD))),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xff4B45BD).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Cancel",
                            style: TextStyle(color: Color(0xff4B45BD))),
                      ),
                    )
                  ],
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openAnimatedDeleteDialog(
    BuildContext context,
    String title,
    String content,
    void Function()? save,
  ) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: AlertDialog(
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xff4B45BD)))),
                    child: Text(title),
                  ),
                  content: Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      content,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xff4B45BD).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Back",
                            style: TextStyle(color: Color(0xff4B45BD))),
                      ),
                    ),
                    MaterialButton(
                      onPressed: save,
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xff4B45BD).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Delete",
                            style: TextStyle(color: Color(0xff4B45BD))),
                      ),
                    )
                  ],
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
