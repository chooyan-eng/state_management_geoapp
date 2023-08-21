import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';
import 'package:state_management_geoapp/standard/point_list_page.dart';
import 'package:state_management_geoapp/standard/state/location_state.dart';
import 'package:state_management_geoapp/standard/state/point_list_state.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _controller = MapController();

  LatLng? _lastPositionUpdated;

  @override
  void didChangeDependencies() {
    final locationState = LocationStateProvider.of(context);
    if (_lastPositionUpdated != locationState.currentLocation) {
      _controller.move(locationState.currentLocation!, _controller.zoom);
      _lastPositionUpdated = locationState.currentLocation;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final locationState = LocationStateProvider.of(context, listen: true);
    final pointList = PointListProvider.of(context, listen: true).pointList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PointListPage.route());
            },
            icon: const Icon(Icons.maps_ugc),
          ),
        ],
      ),
      body: MyMap(
        controller: _controller,
        isTracking: locationState.isTracking,
        pointList: pointList,
        onLongPress: (point) {
          final state = PointListProvider.of(context);
          state.add(Point(comment: '', coordinate: point));
        },
        onCurrentLocationTap: locationState.updateCurrentLocation,
        myLocation: locationState.currentLocation,
        onMove: locationState.stopTracking,
        onTrackPressed: () {
          if (!locationState.locationEnabled) {
            locationState.requestLocation();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Try again after permit location usage.'),
              ),
            );
          } else {
            if (locationState.isTracking) {
              locationState.stopTracking();
            } else {
              _controller.move(_controller.center, 16);
              locationState.startTracking();
            }
          }
        },
      ),
    );
  }
}
