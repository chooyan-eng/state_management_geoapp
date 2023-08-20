import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_geoapp/redux/point_list_page.dart';
import 'package:state_management_geoapp/redux/state/actions/add_point_action.dart';
import 'package:state_management_geoapp/redux/state/app_state.dart';
import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:state_management_geoapp/shared/widget/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,
        ({List<Point> list, ValueChanged<Point> add})>(
      converter: (store) {
        return (
          list: store.state.pointList,
          add: (point) => store.dispatch(AddPointAction(point)),
        );
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Redux'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(PointListPage.route());
                },
                icon: const Icon(Icons.maps_ugc),
              ),
            ],
          ),
          body: MyMap(
            pointList: viewModel.list,
            onLongPress: (point) {
              viewModel.add(Point(comment: '', coordinate: point));
            },
          ),
        );
      },
    );
  }
}
