import 'package:flutter/material.dart';
import 'package:state_management_geoapp/standard/map_page.dart';
import 'package:state_management_geoapp/standard/state/location_state.dart';
import 'package:state_management_geoapp/standard/state/point_list_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationStateProvider(
      child: const PointListProvider(
        child: MaterialApp(
          home: MapPage(),
        ),
      ),
    );
  }
}
