import 'package:flutter/material.dart';

class CostumTextFormFields extends StatelessWidget {
  const CostumTextFormFields(
      {Key? key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.controller,
      this.foucsNode})
      : super(key: key);
  final String? hintText;

  final Icon? icon;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? foucsNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextField(
        focusNode: foucsNode,
        cursorWidth: 3,
        cursorColor: const Color(0xff7E7E7E),
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0x467E7E7E),
              fontSize: 20),
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(width: 2, color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(width: 2, color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(width: 2, color: Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(width: 2, color: Colors.transparent)),
          suffixIcon: icon,
          fillColor: Color(0xB7D9D9D9),
          filled: true,
        ),
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(252, 126, 126, 126),
            fontSize: 20),
      ),
    );
  }
}
