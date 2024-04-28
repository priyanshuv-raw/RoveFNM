import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/customs/contactUs.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class ContactUsPage extends StatelessWidget {


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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextSpace(
                        myMainText: "Contact Us",
                        myMainTextColor: AppColors.primaryColor),
                    SizedBox(
                      height: 20,
                    ),
                    ContactUs(),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                        onTap: () {},
                        myButtonColor: AppColors.primaryColor,
                        myButtonText: "Submit",
                        myButtonTextColor: Colors.white),
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
