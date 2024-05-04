import 'package:flutter/material.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/customs/todaysRide.dart';
import 'package:rove/screens/UserRouteMapPage.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextSpace(
                      myMainText: "Today's Ride",
                      myMainTextColor: AppColors.primaryColor),
                  SizedBox(
                    height: 20,
                  ),
                  TodaysRide(
                    myStartLocation: "UCER",
                    myEndLocation: "Shantipuram",
                    myDepartureTime: "07:50 a.m.",
                    myArrivalTime: "04:30 p.m.",
                    myBusSeats: "K3",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserRouteMapPage()));
                      },
                      myButtonColor: AppColors.primaryColor,
                      myButtonText: "Go to Route Map",
                      myButtonTextColor: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rove/customs/customAppBar.dart';
// import 'package:rove/customs/todaysRide.dart';
// import 'package:rove/screens/UserRouteMapPage.dart';
// import 'package:rove/screens/mapScreen.dart';
// import 'package:rove/screens/menuPage.dart';
// import 'package:rove/screens/notificationPage.dart';
// import 'package:rove/customs/routeMap.dart';
// import 'package:rove/utils/colors.dart';
// import 'package:rove/utils/textTheme.dart';


// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120),
//         child: CustomAppBar(
//           myUserImage: "assets/images/priyanshu.jpg",
//           onNotificationTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => NotificationPage()));
//           },
//           onMenuTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => MenuPage()));
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MyTextSpace(
//                       myMainText: "Today's Ride",
//                       myMainTextColor: AppColors.primaryColor),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TodaysRide(
//                     myStartLocation: "UCER",
//                     myEndLocation: "Shantipuram",
//                     myDepartureTime: "07:50 a.m.",
//                     myArrivalTime: "04:30 p.m.",
//                     myBusSeats: "K3",
//                     onMapRoute: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => UserRouteMapPage()));
//                     },
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
