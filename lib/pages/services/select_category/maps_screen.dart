import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_declarations
  final CameraPosition _kgoogle = const CameraPosition(
    target: LatLng(48.864716, 2.349014),
    zoom: 14.4746,
  );

  final List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(30.4390, 2.349014),
      infoWindow: InfoWindow(
        title: "Carpenter",
      ),
    ),
    const Marker(
      markerId: MarkerId("2"),
      position: LatLng(49.864716, 2.349014),
    ),
    const Marker(
      markerId: MarkerId("3"),
      position: LatLng(50.864716, 2.349014),
    ),
    const Marker(
      markerId: MarkerId("4"),
      position: LatLng(48.864716, 2.349014),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kgoogle,
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
