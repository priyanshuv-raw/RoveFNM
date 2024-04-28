import 'package:flutter/material.dart';
import 'package:rove/customs/aboutUs.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class AboutUsPage extends StatelessWidget {

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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextSpace(
                    myMainText: "About Us",
                    myMainTextColor: AppColors.primaryColor),
                SizedBox(
                  height: 20,
                ),
                AboutUs(
                    myImage: "assets/images/priyanshu.jpg",
                    myNameText: "Priyanshu Kumar",
                    myDescriptionText:
                        "Id nostrud nostrud   Reprehenderit ut aute pariatur sit deserunt aliquip occaecat voluptate duis officia culpa. Adipisicing mollit culpa ex eu amet. Laboris irure cillum sit commodo tempor incididunt elit ipsum excepteur cillum dolore adipisicing velit. Culpa voluptate ipsum pariatur est laboris tempor fugiat dolor amet nostrud do exercitation ipsum. Mollit cillum pariatur ut consectetur sit enim."),
                SizedBox(
                  height: 20,
                ),
                AboutUs(
                    myImage: "assets/images/kanishtha.jpg",
                    myNameText: "Kanishtha Sahu",
                    myDescriptionText:
                        "Id nostrud nostrud non magna esse elit reprehenderit minim consequat dolore ad nulla nisi irure. Ullamco enim dolore in consectetur et dolore Lorem incididunt enim eu officia. Reprehenderit ut aute pariatur sit deserunt aliquip occaecat voluptate duis officia culpa. Adipisicing mollit culpa ex eu amet. Laboris irure cillum sit commodo tempor incididunt elit ipsum excepteur cillum dolore adipisicing velit. Culpa voluptate ipsum pariatur est laboris tempor fugiat dolor amet nostrud do exercitation ipsum. Mollit cillum pariatur ut consectetur sit enim."),
                SizedBox(
                  height: 20,
                ),
                AboutUs(
                    myImage: "assets/images/siddhant.jpg",
                    myNameText: "Siddhant Kumar",
                    myDescriptionText:
                        "Id nostrud nostrud non magna esse elit reprehenderit minim consequat dolore ad nulla nisi irure. Ullamco enim dolore in consectetur et dolore Lorem incididunt enim eu officia. Reprehenderit ut aute pariatur sit deserunt aliquip occaecat voluptate duis officia culpa. Adipisicing mollit culpa ex eu amet. Laboris irure cillum sit commodo tempor incididunt elit ipsum excepteur cillum dolore adipisicing velit. Culpa voluptate ipsum pariatur est laboris tempor fugiat dolor amet nostrud do exercitation ipsum. Mollit cillum pariatur ut consectetur sit enim."),
                SizedBox(
                  height: 20,
                ),
                AboutUs(
                    myImage: "assets/images/tanishqa.jpg",
                    myNameText: "Tanishqa Sharma",
                    myDescriptionText:
                        "Id nostrud nostrud non magna esse elit reprehenderit minim consequat dolore ad nulla nisi irure. Ullamco enim dolore in consectetur et dolore Lorem incididunt enim eu officia. Reprehenderit ut aute pariatur sit deserunt aliquip occaecat voluptate duis officia culpa. Adipisicing mollit culpa ex eu amet. Laboris irure cillum sit commodo tempor incididunt elit ipsum excepteur cillum dolore adipisicing velit. Culpa voluptate ipsum pariatur est laboris tempor fugiat dolor amet nostrud do exercitation ipsum. Mollit cillum pariatur ut consectetur sit enim."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
