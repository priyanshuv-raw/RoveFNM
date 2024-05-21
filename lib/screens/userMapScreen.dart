import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:rove/utils/colors.dart';
import 'package:rove/utils/mapKey.dart';

class userMapScreen extends StatefulWidget {
  const userMapScreen({Key? key});

  @override
  State<userMapScreen> createState() => _userMapScreenState();
}

class _userMapScreenState extends State<userMapScreen> {
  location.Location _locationController = new location.Location();
  LatLng? _currentP;
  static const LatLng sourceLocation = LatLng(25.342968, 81.911266);
  static const LatLng destinationLocation = LatLng(25.494308, 81.861315);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        mapKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
    getPolyPoints();
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
              polylines: {
                Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: AppColors.accentColor,
                    width: 4)
              },
              markers: {
                Marker(
                  markerId: MarkerId("CurrentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  infoWindow: InfoWindow(title: "You"),
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
                //   markerId: MarkerId("source"),
                //   position: sourceLocation,
                // ),
                Marker(
                  markerId: MarkerId("source"),
                  position: destinationLocation,
                )
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
