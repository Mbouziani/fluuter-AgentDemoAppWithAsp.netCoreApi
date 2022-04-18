import 'package:flutter/material.dart';

class CostumeTextField extends StatelessWidget {
  const CostumeTextField({
    required this.controller,
    required this.hintText,
    required this.textInputType,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide(color: Colors.black26, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
      ),
    );
  }
}
