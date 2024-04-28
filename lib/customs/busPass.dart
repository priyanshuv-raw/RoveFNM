import 'package:flutter/material.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class BusPass extends StatelessWidget {
  final String myUserName;
  final String myUserStudentId;
  final String myUserAllotedBus;
  final String myUserDepartment;
  final String myUserValidity;
  final String myUserPhoneNumber;
  final String myUserFeesStatus;
  final String myUserAddress;
  final String myUserBranch;
  final String myUserImage;

  const BusPass({
    super.key,
    required this.myUserValidity,
    required this.myUserFeesStatus,
    required this.myUserStudentId,
    required this.myUserName,
    required this.myUserDepartment,
    required this.myUserBranch,
    required this.myUserPhoneNumber,
    required this.myUserAddress,
    required this.myUserAllotedBus,
    required this.myUserImage,
  });

  @override
  Widget build(BuildContext context) {
    return
        // SingleChildScrollView(child:
        Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 652,
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
          Padding(
            padding: EdgeInsets.all(17),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(myUserImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primaryColor, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/logos/collegeLogo.png"),
                      width: 68,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    MyTextSpace(
                        myMainText: "Validity",
                        myMainTextColor: AppColors.primaryColor),
                    SizedBox(
                      height: 26,
                    ),
                    MyTextSpace(
                        myMainText: "Fees",
                        myMainTextColor: AppColors.primaryColor)
                  ],
                ),
                SizedBox(
                  width: 23,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    const Image(
                      image: AssetImage("assets/logos/collegeNameLogo.png"),
                      width: 80,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    MyTextSpace(
                        myMainText: myUserValidity,
                        myMainTextColor: AppColors.primaryColor),
                    const SizedBox(
                      height: 27,
                    ),
                    MyTextSpace(
                        myMainText: myUserFeesStatus,
                        myMainTextColor: Colors.green)
                  ],
                )
              ],
            ),
          ),

          const SizedBox(
            height: 6,
          ),
          ListTile(
            leading: const MyTextSpace(
              myMainText: "College ID",
              myMainTextColor: AppColors.primaryColor,
            ),
            trailing: MyTextSpace(
              myMainText: myUserStudentId,
              myMainTextColor: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(
            height: 6,
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
            height: 6,
          ),
          ListTile(
            leading: const MyTextSpace(
              myMainText: "Course",
              myMainTextColor: AppColors.primaryColor,
            ),
            trailing: MyTextSpace(
              myMainText: myUserDepartment,
              myMainTextColor: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          ListTile(
            leading: const MyTextSpace(
              myMainText: "Branch",
              myMainTextColor: AppColors.primaryColor,
            ),
            trailing: MyTextSpace(
              myMainText: myUserBranch,
              myMainTextColor: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(
            height: 6,
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
            height: 6,
          ),
          ListTile(
            leading: const MyTextSpace(
              myMainText: "Boarding Point",
              myMainTextColor: AppColors.primaryColor,
            ),
            trailing: MyTextSpace(
              myMainText: myUserAddress,
              myMainTextColor: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(
            height: 6,
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
            height: 6,
          ),
          // Divider between list tiles
        ],
      ),
      // ),
    );
  }
}
