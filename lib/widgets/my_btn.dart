import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final void Function()? onPressed;
  final ButtonStyle? style;
  final String text;
  final TextStyle? styles;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        fixedSize: Size(double.maxFinite, 50),
        // fixedSize: Size(300, 50),
      ),
    );
  }

  MyBtn({this.onPressed, this.style, required this.text, this.styles});
}
