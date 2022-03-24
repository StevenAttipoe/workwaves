import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;


class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng.LatLng(5.78, 0.1),
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
              }
            ),
          ],
        ));
  }
}
