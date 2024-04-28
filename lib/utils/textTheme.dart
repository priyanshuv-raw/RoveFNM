import 'package:flutter/material.dart';

class MyTextSpace extends StatelessWidget {
  final String myMainText;
  final Color myMainTextColor;

  const MyTextSpace({
    super.key,
    required this.myMainText,
    required this.myMainTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      myMainText,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: myMainTextColor, fontSize: 17, fontWeight: FontWeight.w600),
    );
  }
}
