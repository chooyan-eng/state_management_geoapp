import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management_geoapp/mobx/map_page.dart';
import 'package:state_management_geoapp/mobx/state/point_list_state.dart';

void main() {
  _setupStore();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapPage(),
    );
  }
}

void _setupStore() {
  GetIt.I.registerSingleton<PointList>(PointList());
}
