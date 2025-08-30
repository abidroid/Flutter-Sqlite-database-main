import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.controller,
    this.contentPadding,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.cursorColor,
    this.fillColor,
    this.filled,
    this.validator,
    this.keyboardType = TextInputType.text, // default
    this.initialValue,
  });

  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Color? cursorColor, fillColor;
  final bool? filled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      initialValue: initialValue,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.w400
        ),
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        // ok
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      cursorColor: cursorColor ?? Colors.deepPurple,
    );
  }
}