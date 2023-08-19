import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_geoapp/getx/map_page.dart';

void getxMain() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: MapPage());
  }
}
