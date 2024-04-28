import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class ContactUs extends StatelessWidget {
  // final String myNameText;
  // final String myImage;
  // final String myDescriptionText;

  // const ContactUs({
  //   super.key,
  //   required this.myImage,
  //   required this.myNameText,
  //   required this.myDescriptionText,
  // });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Subject",
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.primaryColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
        TextFormField(
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Write here...",
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.primaryColor),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
