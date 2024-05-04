import 'package:flutter/material.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/customs/routeMap.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class UserRouteMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextSpace(
                    myMainText: "Today's Ride Map",
                    myMainTextColor: AppColors.primaryColor),
                SizedBox(
                  height: 20,
                ),
                RouteMapWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
