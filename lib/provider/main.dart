import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_geoapp/provider/map_page.dart';
import 'package:state_management_geoapp/provider/state/point_list_state.dart';
import 'package:state_management_geoapp/standard/state/location_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // [LocationNotifier] for standart approach
          // is also available for Provider approach without any fixes.
          create: (context) => LocationNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PointListState(),
        ),
      ],
      child: const MaterialApp(
        home: MapPage(),
      ),
    );
  }
}
