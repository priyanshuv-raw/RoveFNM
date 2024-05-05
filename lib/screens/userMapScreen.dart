import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

class userMapScreen extends StatefulWidget {
  const userMapScreen({Key? key});

  @override
  State<userMapScreen> createState() => _userMapScreenState();
}

class _userMapScreenState extends State<userMapScreen> {
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
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentP!,
                zoom: 16,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("CurrentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP!,
                ),
                Marker(
                  markerId: MarkerId("CurrentLocation"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueYellow),
                  infoWindow: InfoWindow(title: "Your Bus"),
                  position: _currentP!,
                ),
                // Marker(
                //   markerId: MarkerId('_sourceLocation'),
                //   icon: BitmapDescriptor.defaultMarker,
                //   position: _pGooglePlex,
                // ),
                // Marker(
                //   markerId: MarkerId('_destinationLocation'),
                //   icon: BitmapDescriptor.defaultMarkerWithHue(
                //       BitmapDescriptor.hueBlue),
                //   position: _pApplePark,
                // ),
              },
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
