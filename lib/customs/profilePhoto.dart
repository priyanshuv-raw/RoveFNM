import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';

class ProfilePagePhoto extends StatelessWidget {
  final String myProfileImage;
  final String myBannerImage;

  const ProfilePagePhoto({
    super.key,
    required this.myProfileImage,
    required this.myBannerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          decoration: BoxDecoration(),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(myBannerImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 22,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentColor,
              border: Border.all(width: 2, color: Colors.white),
              image: DecorationImage(
                image: AssetImage(myProfileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
