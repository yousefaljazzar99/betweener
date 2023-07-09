import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? iconData;

  final TextEditingController? myController;
  final bool? hidepassword;
  Function()? pressSuffixIcon;
  TextInputType? textInputType;
  final Function(String?)? validator;

  CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.iconData,
      this.myController,
      this.textInputType,
      this.pressSuffixIcon,
      this.validator,
      this.hidepassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            cursorColor: primaryColor,
            keyboardType: textInputType,
            obscureText: hidepassword ?? false,
            controller: myController,
            focusNode: FocusNode(),
            validator: (value) => validator != null ? validator!(value) : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              suffixIcon: IconButton(
                icon: Icon(
                  iconData,
                  //   color: ColorManager.primary,
                ),
                onPressed: pressSuffixIcon,
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: buttomButtonsIconColor, fontSize: 12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: buttomButtonsIconColor, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
