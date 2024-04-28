import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String myButtonText;
  final Color myButtonColor;
  final Color myButtonTextColor;

  const MyButton(
      {super.key,
      required this.onTap,
      required this.myButtonColor,
      required this.myButtonText,
      required this.myButtonTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: myButtonColor,
          padding: const EdgeInsets.only(top: 17, bottom: 17),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          myButtonText,
          style: TextStyle(
              color: myButtonTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
    );
  }
}
