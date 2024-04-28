import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
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
        onTap: (value) {
          setMarker(value);
        },
      ),
    );
  }
}
