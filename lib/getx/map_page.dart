import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_geoapp/getx/point_list_page.dart';
import 'package:state_management_geoapp/getx/state/point_list_controller.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PointListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(PointListPage());
            },
            icon: const Icon(Icons.maps_ugc),
          ),
        ],
      ),
      body: Obx(
        () {
          final list = controller.pointList.toList();
          return MyMap(
            pointList: list,
            onLongPress: (position) {
              controller.add(
                Point(comment: '', coordinate: position),
              );
            },
          );
        },
      ),
    );
  }
}
