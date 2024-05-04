import 'package:flutter/material.dart';
import 'package:rove/customs/routeMap.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class DriverRouteMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Hey, There 👋🏻",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 110,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(3),
            bottomRight: Radius.circular(3),
          ),
        ),
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage("assets/images/driver.jpg"),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ),
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
