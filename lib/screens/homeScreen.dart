import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rove/customs/button.dart';
import 'package:rove/customs/customAppBar.dart';
import 'package:rove/customs/todaysRide.dart';
import 'package:rove/screens/UserRouteMapPage.dart';
import 'package:rove/screens/menuPage.dart';
import 'package:rove/screens/notificationPage.dart';
import 'package:rove/screens/userMapScreen.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/textTheme.dart';

import 'package:location/location.dart' as location;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  location.Location _locationController = new location.Location();
  LatLng? _currentP;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
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
                    myDepartureTime: "04:10 p.m.",
                    myArrivalTime: "05:30 p.m.",
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
            ),
            _currentP == null
                ? const Center(
                    child: Text("Loading..."),
                  )
                : Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentP!,
                        zoom: 16,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId("CurrentLocation"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueYellow),
                          infoWindow: InfoWindow(title: "Your Bus"),
                          position: _currentP!,
                        ),
                        Marker(
                          markerId: MarkerId("BusLocation"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueBlue),
                          infoWindow: InfoWindow(title: "You"),
                          position: _currentP!,
                        ),
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => userMapScreen(),
            ),
          );
        },
        child: Icon(
          Icons.keyboard_double_arrow_right,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor, // Set the background color
        elevation: 5, // Set the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Set the border radius
        ), // Shift the button 10 pixels to the left
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.Location().serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await location.Location().serviceEnabled();
    } else {
      return;
    }
    _permissionGranted = await location.Location().hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.Location().requestPermission();
    }
    _locationController.onLocationChanged
        .listen((location.LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(_currentP);
        });
      }
    });
  }
}
