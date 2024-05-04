import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  location.Location _locationController = new location.Location();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
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
// // class GoogleMapsScreen extends StatefulWidget {
// //   const GoogleMapsScreen({super.key});

// //   @override
// //   State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
// // }

// // class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
// //   LatLng mylatlong = LatLng(25.34961, 81.86078);
// //   String address = 'Lucknow';

// //   setMarker(LatLng value) async {
// //     List<Placemark> result =
// //         await placemarkFromCoordinates(value.latitude, value.longitude);

// //     if (result.isNotEmpty) {
// //       address =
// //           '${result[0].name},${result[0].locality}${result[0].administrativeArea}';
// //     }

// //     setState(() {});
// //     Fluttertoast.showToast(msg: '📍' + address);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: GoogleMap(
// //         initialCameraPosition: CameraPosition(
// //           target: mylatlong,
// //           zoom: 15,
// //         ),
// //         markers: {
// //           Marker(
// //             infoWindow: InfoWindow(title: address),
// //             position: mylatlong,
// //             draggable: true,
// //             markerId: MarkerId('1'),
// //             onDragEnd: (value) {
// //               setMarker(value);
// //             },
// //           ),
// //         },
// //         onTap: (value) {
// //           setMarker(value);
// //         },
// //       ),
// //     );
// //   }
  
// // }