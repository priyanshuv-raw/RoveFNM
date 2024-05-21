import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class ContactUs extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController subjectController;
  final TextEditingController messageController;

  const ContactUs({
    super.key,
    required this.nameController,
    required this.subjectController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: subjectController,
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
          controller: messageController,
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
