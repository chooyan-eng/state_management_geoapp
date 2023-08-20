import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management_geoapp/mobx/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/widget/point_list.dart'
    as component;

class PointListPage extends StatelessWidget {
  const PointListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const PointListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Point List Page')),
      body: Observer(builder: (context) {
        return component.PointList(
          data: GetIt.I<PointList>().pointList.toList(),
          onTap: (value) {},
        );
      }),
    );
  }
}
