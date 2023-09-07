import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management_geoapp/mobx/point_list_page.dart';
import 'package:state_management_geoapp/mobx/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PointListPage.route());
            },
            icon: const Icon(Icons.maps_ugc),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return MyMap(
            pointList: GetIt.I<PointList>().pointList.toList(),
            onLongPress: (point) {
              GetIt.I<PointList>().add(
                Point(comment: '', coordinate: point),
              );
            },
          );
        },
      ),
    );
  }
}
