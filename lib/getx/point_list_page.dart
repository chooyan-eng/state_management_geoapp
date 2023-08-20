import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_geoapp/getx/state/point_list_controller.dart';
import 'package:state_management_geoapp/shared/widget/point_list.dart';

class PointListPage extends StatelessWidget {
  PointListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => PointListPage());
  }

  final controller = Get.find<PointListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Point List Page')),
      body: Obx(() {
        final list = controller.pointList.toList();
        return PointList(
          data: list,
          onTap: (value) {},
        );
      }),
    );
  }
}
