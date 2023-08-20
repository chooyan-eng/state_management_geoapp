import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_geoapp/riverpod/point_list_page.dart';
import 'package:state_management_geoapp/riverpod/state/current_location.dart';
import 'package:state_management_geoapp/riverpod/state/is_tracking.dart';
import 'package:state_management_geoapp/riverpod/state/location_enabled.dart';
import 'package:state_management_geoapp/riverpod/state/location_permission.dart';
import 'package:state_management_geoapp/riverpod/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState {
  final _controller = MapController();

  @override
  void initState() {
    super.initState();

    // force initialize locationPermissionProvider
    final _ = ref.read(locationPermissionProvider);
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(pointListProvider);

    ref.listen(curentLocationProvider, (_, next) {
      if (next != null) {
        _controller.move(next, _controller.zoom);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
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
        onMove: () {
          ref.read(isTrackingProvider.notifier).stop();
        },
        onCurrentLocationTap: () =>
            ref.read(curentLocationProvider.notifier).updateWithCurrent(),
        myLocation: ref.watch(curentLocationProvider),
        isTracking: ref.watch(isTrackingProvider),
        pointList: list,
        onLongPress: (point) {
          ref.read(pointListProvider.notifier).add(
                Point(comment: '', coordinate: point),
              );
        },
        onTrackPressed: () {
          if (ref.read(locationEnabledProvider)) {
            if (ref.read(isTrackingProvider)) {
              ref.read(isTrackingProvider.notifier).stop();
            } else {
              _controller.move(_controller.center, 16);
              ref.read(isTrackingProvider.notifier).start();
            }
          } else {
            ref.read(locationPermissionProvider.notifier).request();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Try again after permit location usage.'),
              ),
            );
          }
        },
      ),
    );
  }
}
