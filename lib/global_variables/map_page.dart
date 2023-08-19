import 'package:flutter/material.dart';
import 'package:state_management_geoapp/global_variables/point_list_page.dart';
import 'package:state_management_geoapp/global_variables/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GLOBAL VARIABLES'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PointListPage.route());
            },
            icon: const Icon(Icons.maps_ugc),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Point>>(
        valueListenable: pointListState,
        builder: (context, value, child) {
          return MyMap(
            pointList: value,
            onLongPress: (point) {
              pointListState.add(
                Point(comment: '', coordinate: point),
              );
            },
          );
        },
      ),
    );
  }
}
