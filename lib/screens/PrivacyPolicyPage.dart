import 'package:flutter/material.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/customs/privacy%20policy.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: CustomAppBar(
            myUserImage: "assets/images/priyanshu.jpg",
            onNotificationTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            onMenuTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: MyTextSpace(
                  myMainText: "Privacy Policy",
                  myMainTextColor: AppColors.primaryColor),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: PrivacyPolicy(),
            ),
          ]),
        ),
      ),
    );
  }
}
