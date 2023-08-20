import 'package:flutter/material.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';
import 'package:state_management_geoapp/standard/point_list_page.dart';
import 'package:state_management_geoapp/standard/state/point_list_state.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
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
        pointList: pointList,
        onLongPress: (point) {
          final state = PointListProvider.of(context);
          state.add(Point(comment: '', coordinate: point));
        },
      ),
    );
  }
}
