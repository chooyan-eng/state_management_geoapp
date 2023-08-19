import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:state_management_geoapp/getx/point_list_page.dart';
import 'package:state_management_geoapp/getx/state/point_list_controller.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

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
          final list = controller.pointList;
          // TODO(chooyan-eng): can't use shared [MyMap] widget
          return FlutterMap(
            options: MapOptions(
              center: const LatLng(51.509364, -0.128928),
              zoom: 9.2,
              onLongPress: (_, position) {
                controller.add(
                  Point(comment: '', coordinate: position),
                );
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: list
                    .map(
                      (point) => Marker(
                        point: point.coordinate,
                        builder: (context) => const Icon(
                          Icons.maps_ugc,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
