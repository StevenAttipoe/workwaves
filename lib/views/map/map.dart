import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late Position position;

  @override
  void initState() {
    super.initState();
    getGeoLocationPosition();
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      position = location;
    });

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    getGeoLocationPosition();

    return Container(
        child: FlutterMap(
      options: MapOptions(
        center: LatLng.LatLng(position.latitude, position.longitude),
        zoom: 15.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/yoitstevex/cl0iixy5r005914vx93htoxxs/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieW9pdHN0ZXZleCIsImEiOiJjbDBpaW82YTkwMDZqM2NvdGoxOHQwNjJqIn0.SeMZ4lWMa5nldMlHi5n7sg",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoieW9pdHN0ZXZleCIsImEiOiJjbDBpaW82YTkwMDZqM2NvdGoxOHQwNjJqIn0.SeMZ4lWMa5nldMlHi5n7sg',
              'id': 'mapbox.country-boundaries-v1'
            }),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng.LatLng(5.763339126301425,-0.2206036355921337),
              builder: (ctx) => Column(
                children: const [
                  Icon(
                    Icons.my_location,
                    color: Colors.white),
                  Text("Student Tutor Needed")
                  ]
              ),
            ),
             Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng.LatLng(5.767561917050639,-0.22089649928894728),
              builder: (ctx) => Column(
                children: const [
                  Icon(
                    Icons.my_location,
                    color: Colors.white),
                  Text("Student Driver Needed")
                  ]
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng.LatLng(5.759153498737126,-0.2235914487966606),
              builder: (ctx) => Column(
                children: const [
                  Icon(
                    Icons.my_location,
                    color: Colors.white),
                  Text("Student Driver Needed")
                  ]
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
