import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class MyMap extends StatelessWidget {
  const MyMap({
    super.key,
    this.onLongPress,
    this.pointList = const [],
  });

  final ValueChanged<LatLng>? onLongPress;
  final List<Point> pointList;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: const LatLng(51.509364, -0.128928),
        zoom: 9.2,
        onLongPress: (_, position) => onLongPress?.call(position),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: pointList
              .map(
                (point) => Marker(
                  point: point.coordinate,
                  builder: (context) => const Icon(
                    Icons.maps_ugc,
                    size: 24,
                    color: Colors.blue,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
