import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_geoapp/riverpod/state/point_list_state.dart';
import 'package:state_management_geoapp/shared/widget/point_list.dart'
    as component;

class PointListPage extends ConsumerWidget {
  const PointListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const PointListPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(pointListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Point List Page')),
      body: component.PointList(
        data: list,
        onTap: (value) {},
      ),
    );
  }
}
