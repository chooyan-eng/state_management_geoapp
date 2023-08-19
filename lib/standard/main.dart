import 'package:flutter/material.dart';
import 'package:state_management_geoapp/standard/map_page.dart';
import 'package:state_management_geoapp/standard/state/point_list_state.dart';

void standardMain() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PointListProvider(
      child: MaterialApp(
        home: MapPage(),
      ),
    );
  }
}
