import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class ProfileDetails extends StatelessWidget {
  final String myUserName;
  final String myUserStudentId;
  final String myUserAllotedBus;
  final String myUserCollege;
  final String myUserDepartment;
  final String myUserYear;
  final String myUserPhoneNumber;
  final String myUserEmergencyContact;
  final String myUserAddress;

  const ProfileDetails({
    super.key,
    required this.myUserName,
    required this.myUserStudentId,
    required this.myUserAllotedBus,
    required this.myUserCollege,
    required this.myUserDepartment,
    required this.myUserYear,
    required this.myUserPhoneNumber,
    required this.myUserEmergencyContact,
    required this.myUserAddress,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 705,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: AppColors.primaryColor, // Border color
            width: 2.0, // Border width
          ),
        ),
        // child: const Center(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Name",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserName,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Student ID",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserStudentId,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Alloted Bus",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserAllotedBus,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "College",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserCollege,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Department",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserDepartment,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Year",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserYear,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Phone",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserPhoneNumber,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles

            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Emergency Ph.",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserEmergencyContact,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
            ), // Divider between list tiles
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const MyTextSpace(
                myMainText: "Address",
                myMainTextColor: AppColors.primaryColor,
              ),
              trailing: MyTextSpace(
                myMainText: myUserAddress,
                myMainTextColor: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
