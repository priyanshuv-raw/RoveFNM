import 'package:flutter/material.dart';
import 'package:rove/customs/profileDetails.dart';
import 'package:rove/customs/profilePhoto.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/userData.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          toolbarHeight: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ProfilePagePhoto(
                      myProfileImage: "assets/images/priyanshu.jpg",
                      myBannerImage: "assets/images/cover.jpg")
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetails(
                        myUserName: UserData.userName,
                        myUserStudentId: UserData.userRoll,
                        myUserAllotedBus: "B2",
                        myUserCollege: "UCER",
                        myUserDepartment: "CSE",
                        myUserYear: UserData.userYear.toString(),
                        myUserPhoneNumber: UserData.userPhone,
                        myUserEmergencyContact: "90000 00000",
                        myUserAddress: UserData.userStoppage),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
