import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealMap extends StatefulWidget {
  @override
  _RealMapState createState() => _RealMapState();
}



class _RealMapState extends State<RealMap> {
  var lat = "";
  var lon = "";
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _school = CameraPosition(
    target: LatLng(36.3065056,127.3403835),

    zoom: 14.4746,
  );

  static final CameraPosition _myhome = CameraPosition(
      target: LatLng(36.3099412,127.3414277),
      zoom: 18);

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF242959),
          title: Text(
            "내 주위 안심터",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _school,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _myHome,
          label: Text("Home"),
          icon: Icon(Icons.home),
        ),
      ),
    );
  }

  Future<void> _myHome() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myhome));
  }

  Future<void> getPosition() async {
    var currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    // print(currentPosition);
    lat = currentPosition.toString();
    lon = currentPosition.toString();
    lat.split(",");
    print(lat);
    //왜 split, subString이 안먹히는지 모름
  }
}
