import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_geoapp/getx/state/point_list_controller.dart';

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
        // TODO(chooyan-eng): can't use shared [PointList] widget
        return ListView.builder(
            itemCount: controller.pointList.length,
            itemBuilder: (context, index) {
              final point = controller.pointList[index];
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'lat: ${point.coordinate.latitude} / lng: ${point.coordinate.longitude}',
                      ),
                      if (point.comment.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(point.comment),
                      ]
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
