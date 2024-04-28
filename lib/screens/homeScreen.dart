import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/customs/todaysRide.dart';
import 'package:rove/screens/mapScreen.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';
import 'package:rove/utils/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   LatLng mylatlong = LatLng(25.34961, 81.86078);
  String address = 'Lucknow';

  setMarker(LatLng value) async {
    List<Placemark> result =
        await placemarkFromCoordinates(value.latitude, value.longitude);

    if (result.isNotEmpty) {
      address =
          '${result[0].name},${result[0].locality}${result[0].administrativeArea}';
    }

    setState(() {});
    Fluttertoast.showToast(msg: '📍' + address);
  }

  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
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
                      myFromLocation: "UCER",
                      myToLocation: UserData.userStoppage,
                      myBusNumber: UserData.userAllotedBus,
                      myBusETA: "07:50 AM"),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: mylatlong,
                          zoom: 15,
                        ),
                        markers: {
                          Marker(
                            infoWindow: InfoWindow(title: address),
                            position: mylatlong,
                            draggable: true,
                            markerId: MarkerId('1'),
                            onDragEnd: (value) {
                              setMarker(value);
                            },
                          ),
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GoogleMapsScreen()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
// import 'package:rove/screens/loginPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late SharedPreferences preferences;
//   late String userRole, userEmail, userName, userCourse, userBranch;
//   late int userYear;
//   late String userRoll, userPhone, userStoppage, userId;
//   late String accessExpires, refreshExpires;

//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences();
//   }

//   void initSharedPreferences() async {
//     preferences = await SharedPreferences.getInstance();
//     setState(() {
//       userRole = preferences.getString('userRole') ?? '';
//       userEmail = preferences.getString('userEmail') ?? '';
//       userName = preferences.getString('userName') ?? '';
//       userCourse = preferences.getString('userCourse') ?? '';
//       userBranch = preferences.getString('userBranch') ?? '';
//       userYear = preferences.getInt('userYear') ?? 0;
//       userRoll = preferences.getString('userRoll') ?? '';
//       userPhone = preferences.getString('userPhone') ?? '';
//       userStoppage = preferences.getString('userStoppage') ?? '';
//       userId = preferences.getString('userId') ?? '';
//       accessExpires = preferences.getString('accessExpires') ?? '';
//       refreshExpires = preferences.getString('refreshExpires') ?? '';
//     });
//   }

//   void logout() async {
//     await preferences.clear();
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: logout,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('User Role: $userRole[1]'),
//             SizedBox(height: 8.0),
//             Text('Email: $userEmail[1]'),
//             SizedBox(height: 8.0),
//             Text('Name: $userName[1]'),
//             SizedBox(height: 8.0),
//             Text('Course: $userCourse[1]'),
//             SizedBox(height: 8.0),
//             Text('Branch: $userBranch[1]'),
//             SizedBox(height: 8.0),
//             Text('Year: $userYear[1]'),
//             SizedBox(height: 8.0),
//             Text('Roll Number: $userRoll[1]'),
//             SizedBox(height: 8.0),
//             Text('Phone: $userPhone[1]'),
//             SizedBox(height: 8.0),
//             Text('Stoppage: $userStoppage[1]'),
//             SizedBox(height: 8.0),
//             Text('User ID: $userId[1]'),
//             SizedBox(height: 8.0),
//             Text('Access Token Expires: $accessExpires[1]'),
//             SizedBox(height: 8.0),
//             Text('Refresh Token Expires: $refreshExpires[1]'),
//           ],
//         ),
//       ),
//     );
//   }
// }