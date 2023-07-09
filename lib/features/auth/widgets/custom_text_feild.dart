import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    Key? key,
    required this.hintText,
    required this.label,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
    this.textEnable,
    this.hidepassword,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final String label;
  bool showPass = false;
  final bool? hidepassword;

  bool? obscureText;
  bool? textEnable = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(
          height: 7,
        ),
        SizedBox(
            child: TextFormField(
          validator: (value) => validator!(value),
          controller: controller,
          focusNode: FocusNode(),
          obscureText: hidepassword ?? false,
          onFieldSubmitted: null,
          enabled: textEnable,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: whiteColor,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            hintText: hintText,
            suffixIcon: obscureText!
                ? InkWell(
                    onTap: () {},
                    child: showPass
                        ? const Icon(
                            Icons.remove_red_eye,
                            color: primaryColor,
                          )
                        : const Icon(
                            Icons.remove_red_eye_outlined,
                            color: primaryColor,
                          ),
                  )
                : null,
            hintStyle:
                TextStyle(color: backgroundAddLinkIconColor, fontSize: 12),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: buttomButtonsIconColor, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: buttomButtonsIconColor, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        )),
      ],
    );
  }
}
