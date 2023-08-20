import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_geoapp/provider/point_list_page.dart';
import 'package:state_management_geoapp/provider/state/point_list_state.dart';
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
    final pointList = context.watch<PointListState>().pointList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
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
          context.read<PointListState>().add(
                Point(comment: '', coordinate: point),
              );
        },
      ),
    );
  }
}
