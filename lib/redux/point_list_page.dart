import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_geoapp/redux/state/app_state.dart';
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
      body: StoreConnector<AppState, List<Point>>(
        converter: (store) => store.state.pointList,
        builder: (context, list) {
          return PointList(
            data: list,
            onTap: (value) {},
          );
        },
      ),
    );
  }
}
