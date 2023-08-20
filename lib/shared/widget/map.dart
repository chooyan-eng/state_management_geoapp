import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class MyMap extends StatelessWidget {
  const MyMap({
    super.key,
    this.onLongPress,
    this.pointList = const [],
    this.onTrackPressed,
    this.isTracking = false,
    this.controller,
    this.onCurrentLocationTap,
    this.onMove,
    this.myLocation,
  });

  final ValueChanged<LatLng>? onLongPress;
  final List<Point> pointList;
  final VoidCallback? onTrackPressed;
  final bool isTracking;
  final MapController? controller;
  final VoidCallback? onCurrentLocationTap;
  final VoidCallback? onMove;
  final LatLng? myLocation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FlutterMap(
          mapController: controller,
          options: MapOptions(
            center: const LatLng(51.509364, -0.128928),
            zoom: 9.2,
            onLongPress: (_, position) => onLongPress?.call(position),
            onMapEvent: (event) {
              if (event.source == MapEventSource.onDrag) {
                onMove?.call();
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(
              markers: [
                ...pointList.map(
                  (point) => Marker(
                    point: point.coordinate,
                    builder: (context) => const Icon(
                      Icons.maps_ugc,
                      size: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
                if (myLocation != null)
                  Marker(
                    point: myLocation!,
                    builder: (context) => const Icon(
                      Icons.circle,
                      size: 20,
                      color: Colors.red,
                    ),
                  )
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 32,
          child: isTracking
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: onTrackPressed,
                  child: const Text('STOP TRACKING'),
                )
              : ElevatedButton(
                  onPressed: onTrackPressed,
                  child: const Text('START TRACKING'),
                ),
        ),
        Positioned(
          right: 32,
          top: 32,
          child: InkWell(
            onTap: onCurrentLocationTap,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: const Center(
                child: Icon(
                  Icons.my_location_rounded,
                  color: Colors.black54,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
