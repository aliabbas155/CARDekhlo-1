// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// ignore: camel_case_types
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType textInputType;
  String label;
  IconData? icon;
  Widget? suffix;
  Color? filledColor;
  Color? textColor;
  bool? fill;
  String? hint;
  String? suffixText;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.label,
    this.icon,
    this.suffix,
    this.filledColor,
    this.textColor,
    this.fill,
    this.hint,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: textColor),
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 4),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        // prefixIcon: Icon(
        //   icon,
        //   color: Colors.white,
        // ),
        suffixIcon: suffix,
        suffixText: suffixText,
        suffixStyle: const TextStyle(color: Colors.white),
        fillColor: filledColor,
        filled: fill,
      ),
    );
  }
}


// TextField(
//                 controller: _passwordController,
//                 keyboardType: TextInputType.visiblePassword,
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 decoration: kTextFieldDecoration.copyWith(
//                     icon: Icon(
//                       Icons.password,
//                       color: Colors.white,
//                     ),
//                     hintText: 'enter pass',
//                     filled: true,
//                     fillColor: Colors.white),
//               ),