import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_geoapp/provider/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/widget/point_list.dart';

class PointListPage extends StatelessWidget {
  const PointListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const PointListPage());
  }

  @override
  Widget build(BuildContext context) {
    final list = context.watch<PointListState>().pointList;
    return Scaffold(
      appBar: AppBar(title: const Text('Point List Page')),
      body: PointList(
        data: list,
        onTap: (value) {},
      ),
    );
  }
}
