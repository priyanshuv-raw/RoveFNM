import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 187,
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: AppColors.primaryColor, // Border color
          width: 2.0, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(children: [ListTile(
          leading: Text("Heeloo"),
          trailing: Text("data"),
        )],)
      ),
    );
  }
}
