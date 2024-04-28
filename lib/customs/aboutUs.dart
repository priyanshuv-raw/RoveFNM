
import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class AboutUs extends StatelessWidget {
  final String myNameText;
  final String myImage;
  final String myDescriptionText;

  const AboutUs({
    super.key,
    required this.myImage,
    required this.myNameText,
    required this.myDescriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .9,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            border: Border(
              top: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
              left: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
              right: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(myImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              MyTextSpace(
                  myMainText: myNameText,
                  myMainTextColor: AppColors.primaryColor),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .9,
          height: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(
              color: AppColors.primaryColor, // Border color
              width: 2.0, // Border width
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              myDescriptionText,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 86, 86, 86),
              ),
            ),
          ),
        )
      ],
    );
  }
}
