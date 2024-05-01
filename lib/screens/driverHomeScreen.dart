import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rove/customs/todaysRide.dart';
import 'package:rove/screens/driverLoginPage.dart';
import 'package:rove/screens/mapScreen.dart';
import 'package:rove/screens/userType.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';
import 'package:rove/utils/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
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

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear the shared preferences
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => UserType()),
      (route) => false,
    );
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
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(UserData.userName),
              accountEmail: Text(UserData.userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/driver.jpg"),
              ),
              decoration: BoxDecoration(color: AppColors.primaryColor),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Start Location Sharing'),
              onTap: () {
                // Navigate to the home page
              },
            ),
            ListTile(
              leading: Icon(Icons.location_off),
              title: Text('Stop Location Sharing'),
              onTap: () {
                // Navigate to the home page
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                //
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                            width: 2.0,
                            color: AppColors
                                .primaryColor), // Border color and weight
                      ),
                      title: Text(
                        "Are you sure?",
                        style: TextStyle(
                          color: AppColors.primaryColor, // Text color #292929
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color:
                                  AppColors.primaryColor, // Text color #292929
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color:
                                  AppColors.primaryColor, // Text color #292929
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _logout(context);
                          },
                        ),
                      ],
                    );
                  },
                );
                // Navigate to the home page
              },
            ),
            // Add more menu items as needed
          ],
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
                      myToLocation: "Shantipuram",
                      myBusNumber: "B2",
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
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoogleMapsScreen()));
                        },
                        child: Text("Click to view")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
