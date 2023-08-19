import 'package:flutter/material.dart';
import 'package:state_management_geoapp/global_variables/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/point_list.dart';

class PointListPage extends StatelessWidget {
  const PointListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const PointListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Point List Page')),
      body: ValueListenableBuilder<List<Point>>(
          valueListenable: pointListState,
          builder: (context, value, child) {
            return PointList(
              data: value,
              onTap: (value) {},
            );
          }),
    );
  }
}
