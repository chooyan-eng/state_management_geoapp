import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_geoapp/riverpod/point_list_page.dart';
import 'package:state_management_geoapp/riverpod/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(pointListProvider);

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
        pointList: list,
        onLongPress: (point) {
          ref.read(pointListProvider.notifier).add(
                Point(comment: '', coordinate: point),
              );
        },
      ),
    );
  }
}
