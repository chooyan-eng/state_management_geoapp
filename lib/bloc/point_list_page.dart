import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_geoapp/bloc/state/point_list_cubit.dart';
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
      body: BlocBuilder<PointListCubit, List<Point>>(
          builder: (context, pointList) {
        return PointList(
          data: pointList,
          onTap: (value) {},
        );
      }),
    );
  }
}
