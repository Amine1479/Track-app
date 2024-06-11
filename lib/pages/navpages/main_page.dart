import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  final Widget? homeScreen;
  const MainPage({Key? key, this.homeScreen}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _cameraPosition = CameraPosition(
      target: LatLng(4.0511, 9.7679),
      zoom: 15,
    );
  }

  _getCurrentLocation() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    return _getMap();
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6),
          ]),
      child: ClipOval(
        child: Image.asset("assets/d.jpg"),
      ),
    );
  }

  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: _getMarker(),
          ),
        ),
      ],
    );
  }
}
