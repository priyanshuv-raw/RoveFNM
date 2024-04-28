import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Icon myIcon;
  final String myLabelText;
  final bool myObscureText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.myIcon,
    required this.myLabelText,
    required this.myObscureText,
    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        obscureText: myObscureText,
        decoration: InputDecoration(
          labelText: myLabelText,
          prefixIcon: myIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
