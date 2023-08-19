import 'package:flutter/material.dart';
import 'package:state_management_geoapp/shared/widget/point_list.dart';
import 'package:state_management_geoapp/standard/state/point_list_state.dart';

class PointListPage extends StatelessWidget {
  const PointListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const PointListPage());
  }

  @override
  Widget build(BuildContext context) {
    final list = PointListProvider.of(context).pointList;
    return Scaffold(
      appBar: AppBar(title: const Text('Point List Page')),
      body: PointList(
        data: list,
        onTap: (value) {},
      ),
    );
  }
}
